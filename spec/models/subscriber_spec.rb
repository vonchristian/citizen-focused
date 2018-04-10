require 'rails_helper'

describe Subscriber do
  describe 'associations' do
    it { is_expected.to have_many :businesses }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end
end
