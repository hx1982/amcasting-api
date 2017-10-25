require 'rails_helper'

RSpec.describe Tax, type: :model do
  it {should belong_to(:tax_type)}
end
