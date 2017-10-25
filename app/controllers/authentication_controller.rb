class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate
  # return auth token once user is authenticated
  def authenticate
    result=
      AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response({
      auth_token: result[:token],
      email: result[:user].email,
      current_member_id: result[:user].member.id
    })
  end

  def updatePassword
    if current_user.authenticate(params[:oldPassword])
      current_user.password = params[:newPassword]
      current_user.password_confirmation = params[:newPassword]
      current_user.save()
      json_response(true)
    else
      json_response(false)
    end
  end

  private

  def auth_params
    params.permit(:email, :password)
  end

  def password_params
    params.permit(:oldPassword, :newPassword)
  end
end
