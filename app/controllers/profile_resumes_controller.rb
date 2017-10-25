class ProfileResumesController < ApplicationController
  before_action :set_profile, only: [:index]
  def index
    profile_resume_hash = @profile_resume.attributes
    profile_resume_hash[:resume_section_ids] = @profile_resume.resume_section_ids

    json_response({
        profile_resume: [profile_resume_hash],
        resume_section: @profile_resume.resume_section.map { |s|
          rs = s.attributes
          rs[:resume_table_cell_ids] = s.resume_table_cell_ids
          rs[:resume_table_medium_ids] = s.resume_table_medium_ids
          rs
        },
        resume_cell: @profile_resume.resume_section.map { |section| section.resume_table_cell}.flatten(1),
        resume_medium: @profile_resume.resume_section.map { |section| section.resume_table_medium}.flatten(1),
    })
  end

  def updateCredit
    if params[:creditResume].present? and params[:profile_id].present?
      @profile_resume = ProfileResume.find_by(:profile_id => params[:profile_id])
      @profile_resume.resume_section.clear()
      params[:creditResume].each do |index, section|
        resumeSection = @profile_resume.resume_section.create(text: section[:text],
          title: section[:title], sequence: index, is_paragraph: section[:is_paragraph], row: section[:row], column: section[:column])
        if section[:cells].present?
          section[:cells].each do |index2, cell|
            resumeSection.resume_table_cell.create(row: cell[:row], column: cell[:column], text: cell[:text])
          end
        end
      end
    end
  end

  private
  def set_profile
    @profile = Profile.find(params[:profile_id])
    @profile_resume = ProfileResume.includes(:resume_section => [:resume_table_cell, :resume_table_medium]).find_by(:profile_id => @profile.id) if @profile
    if @profile_resume.nil?
      @profile_resume = @profile.create_profile_resume!()
    end
  end
end
