require 'rails_helper'

describe Business do
  describe 'associations' do
    it { is_expected.to belong_to :city_or_municipality }
    it { is_expected.to belong_to :barangay }
    it { is_expected.to belong_to :mode_of_payment }
    it { is_expected.to have_many :business_owners }
    it { is_expected.to have_many :taxpayer_owners }
    it { is_expected.to have_many :business_charges }
    it { is_expected.to have_many :charges }
    it { is_expected.to have_many :gross_sales }
    it { is_expected.to have_many :business_activities }
  end
  describe 'delegations' do
    it { is_expected.to delegate_method(:name).to(:mode_of_payment).with_prefix }
  end
end
