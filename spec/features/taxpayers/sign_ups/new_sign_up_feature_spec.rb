require 'rails_helper'

feature 'New sign up' do
  scenario 'with valid attributes' do
    visit citizen_focused_index_url
    click_link "Sign Up"
    fill_in "First Name", with: "Von Christian"
    fill_in "Middle Name", with: "Pinosan"
    fill_in "Last Name", with: "Halip"
    click_button "Sign Up"

    expect(page).to have_content("successfully")
  end
end
