class SkillGroupsController < ApplicationController
  def index
    skill_groups = SkillGroup.includes(:skill).all
    json_response({
        skill: skill_groups.map { |group| group.skill}.flatten(1),
        skill_groups: skill_groups.map { |group| { id: group.id, name: group.name, description: group.description, sequence: group.sequence, skill_ids: group.skill.ids}}
    })
  end
end
