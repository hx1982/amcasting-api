class ProfileSkillsController < ApplicationController
  before_action :set_profile, only: [:index, :saveAll]

  def index
    json_response({
        profile_skill: @profile_skills
    })
  end

  def saveAll
    if params['skills'].present?
      @profile_skills.delete_all()
      params['skills'].each do |index, skill|
        profileSKill = @profile.profile_skill.find_or_create_by(skill_id: skill[:id])
        profileSKill.update(level: skill[:level])
      end
    end
  end

  private
  def set_profile
    @profile = Profile.find(params[:profile_id])
    @profile_skills = @profile.profile_skill if @profile
  end
end
