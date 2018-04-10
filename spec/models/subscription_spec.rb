require 'rails_helper'

describe Subscription do
  describe 'associations' do
    it { is_expected.to belong_to :plan }
    it { is_expected.to belong_to :subscriber }
  end
end
