require 'rails_helper'

feature "New Business" do
  scenario 'with valid attributes' do
    taxpayer = create(:taxpayer)
    visit taxpayer_url(taxpayer)
    click_link "New Business"
    fill_in "Name", with: "Test business"
    click_button "Save"
  end
end
