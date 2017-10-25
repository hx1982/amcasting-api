class MemberSocialsController < ApplicationController
  before_action :set_member, only: [:index]
  before_action :set_social, only: [:update]
  def index
    socials = @member.member_social
      .joins(:social_type)
      .select('member_socials.id, member_socials.member_id, member_socials.link, member_socials.is_visible, social_types.code')
    json_response({
      member_socials: socials
    });
  end

  def create
    social_type = SocialType.find_by!(code: social_parameter[:code])
    member_social = MemberSocial.create!({
        :member_id => social_parameter[:member_id],
        :social_type_id => social_type.id,
        :link => social_parameter[:link],
        :is_visible => social_parameter[:is_visible]
    })

    json_response({
      member_social: member_social
    })
  end

  def update
    if (social_parameter[:link].present?)
      @social.link = social_parameter[:link]
    end

    if (social_parameter[:is_visible].present?)
      @social.is_visible = social_parameter[:is_visible]
    end

    @social.save()
    head :no_content

  end

  def social_parameter
    params.require(:member_social).permit(:link, :is_visible, :member_id, :code)
  end

  def set_social
    @social = MemberSocial.find(params[:id]) if params[:id]
  end

  def set_member
    @member = Member.find(params[:member_id]) if params[:member_id]
  end
end
