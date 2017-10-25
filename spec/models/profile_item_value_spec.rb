require 'rails_helper'

RSpec.describe ProfileItemValue, type: :model do
  it {should belong_to(:profile_item)}
end
