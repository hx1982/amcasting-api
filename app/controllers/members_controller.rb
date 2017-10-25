class MembersController < ApplicationController
  before_action :set_member

  def update
    if member_params[:first_name].present?
      @member.first_name = member_params[:first_name]
    end

    if member_params[:middle_name].present?
      @member.middle_name = member_params[:middle_name]
    end

    if member_params[:last_name].present?
      @member.last_name = member_params[:last_name]
    end

    if member_params[:gender_code].present?
      @member.gender_code = member_params[:gender_code]
    end

    if member_params[:email].present?
      @member.email = member_params[:email]
    end

    if member_params[:phone].present?
      @member.phone = member_params[:phone]
    end

    @member.save()
  end

  def show
    json_response({
      member: {
        id: @member.id,
        first_name: @member.first_name,
        middle_name: @member.middle_name,
        last_name: @member.last_name,
        gender_code: @member.gender_code,
        email: @member.email,
        phone: @member.phone,
        artist_id: (@member.artist ? @member.artist.id : 0),
      }
    })
  end

  def current_member
    json_response({
      member: current_user.member
    })
  end

  def member_params
    params.require(:member).permit(:first_name, :middle_name, :last_name, :gender_code, :email, :phone)
  end

  private
  def set_member
    @member = Member.find(params[:id]) if params[:id].present?
  end

end
