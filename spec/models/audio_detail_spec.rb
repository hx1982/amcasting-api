require 'rails_helper'

RSpec.describe AudioDetail, type: :model do
  it { should belong_to(:medium_detail)}
end
