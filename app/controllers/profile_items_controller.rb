class ProfileItemsController < ApplicationController
  def index
    rs = ProfileItem.joins([:profile_item_value, :profile_item_type])
    .where('profile_items.profile_id = ?', params[:profile_id])
    .select('profile_item_values.id,profile_items.profile_item_type_code,
      CASE profile_item_types.value_code
      WHEN "CONV" THEN  profile_item_values.conversion_id
      WHEN "MIMA" THEN  profile_item_values.value
      ELSE profile_item_values.profile_value_item_type_value_id END as value
    ')
    json_response({
        profile_item: rs
    })
  end

  def saveStatistics
    if params[:stats].present? and params[:profile_id].present?
      @profile= Profile.find(params[:profile_id])
      @profile.profile_item.clear()
      params[:stats].each do |index, stats|
        if stats[:values].present?
          profile_item = ProfileItem.create(
            profile_item_type_code: stats[:profile_item_type_code],
            profile_item_type_id: stats[:profile_item_type_id],
            profile_id: params[:profile_id],
            is_display: params[:is_display]
          )
          stats[:values].each do |value|
            if stats[:type] == 'CONV'
              profile_item.profile_item_value.create(conversion_id: value)
            elsif stats[:type] == 'VALU'
              profile_item.profile_item_value.create(profile_value_item_type_value_id: value)
            elsif stats[:type] == 'MIMA'
              profile_item.profile_item_value.create(value: value)
            end
          end
        end
      end
    end
  end

end
