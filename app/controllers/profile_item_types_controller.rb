class ProfileItemTypesController < ApplicationController
  def index
    profile_item_types = ProfileItemType.all().map { |p| p.attributes}
    profile_item_options = [];
    #type options
    profile_item_options = ProfileValueItemTypeValue.all().map { |p| ({
      :profile_item_type_code => p.profile_item_type_code,
      :profile_item_type_id => p.profile_item_type_id,
      :type => 'VALU',
      :value => p.id,
      :name => p.name,
      :level1 => p.level1,
      :level2 => p.level2
    })} + Conversion.all().map { |c| ({
      :profile_item_type_code => c.profile_item_type_code,
      :profile_item_type_id => c.profile_item_type_id,
      :type => 'CONV',
      :value => c.id,
      :name => {
        :au => c.au_value,
        :eu => c.eu_value,
        :us => c.us_value,
        :uk => c.uk_value,
        :fr => c.fr_value,
      },
    })} + ProfileRangeItemTypeValue.all().map { |r| (
        result = []
        min = r.min
        while min < r.max do
          result.push({
            :profile_item_type_code => r.profile_item_type_code,
            :profile_item_type_id => r.profile_item_type_id,
            :type => 'MIMA',
            :value => min,
            :name => populate_values(min, r.profile_item_type_code) ,
          })
          min = min + r.step
        end
        result
    )}.flatten(1)

    #generate the id for options
    profile_item_options.each_with_index { |p, index| p[:id] = index}
    #add relation ship between type and options
    profile_item_types = ProfileItemType.all().map { |p| (
        rs = p.attributes
        rs[:profile_item_option_ids] = profile_item_options.select { |o| o[:profile_item_type_code] == p[:code]}.map {|r| r[:id]}
        rs
    )}
    json_response({
        profile_item_type: profile_item_types,
        profile_item_type_option: profile_item_options
    })
  end

  def ethnicities
    json_response(
      ProfileItemType
        .where(code: 'ENTH')
        .to_json(:include => [:profile_value_item_type_value])
        )
  end

  private
  def populate_values(number, code)
    calc = number / 2.54
    conversion1 = (calc / 12).round
    if code == 'HGHT'
      conversion2 = (calc % 12).floor
      return number.to_s + ' cm / ' + conversion1.to_s + "'" + conversion2.to_s + '"'
    else
      return number.to_s + ' cm / ' + conversion1.to_s + '""'
    end
  end
end
