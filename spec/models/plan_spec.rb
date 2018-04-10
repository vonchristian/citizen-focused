require 'rails_helper'

describe Plan do
  describe 'associations' do
    it { is_expected.to have_many :subscriptions }
    it { is_expected.to have_many :subscribers }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end
end
