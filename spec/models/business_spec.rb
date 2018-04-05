require 'rails_helper'

describe Business do
  describe 'associations' do
    it { is_expected.to have_many :business_owners }
    it { is_expected.to have_many :taxpayer_owners }
  end
end
