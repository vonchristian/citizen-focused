require 'rails_helper'

RSpec.describe BusinessOwner, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :business }
    it { is_expected.to belong_to :owner }
  end
  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:owner_id).scoped_to(:business_id) }
  end
end
