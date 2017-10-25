class SkillsController < ApplicationController
  def index
    json_response(SkillGroup.order(:sequence).to_json(:include => [:skill]))
  end
end
