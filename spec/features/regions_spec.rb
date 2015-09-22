require 'rails_helper'

feature 'Region creation' do
  scenario 'adds a new region' do

    expect {
      visit root_path
      click_link 'Configuration'
      click_link 'Regions'
      click_link 'New Region'

      fill_in 'Name', with: 'Antioquia'
      click_button 'Create Region'
    }.to change(Region, :count).by(1)

    expect(current_path).to eq regions_path
    expect(page).to have_content 'Region was successfully created.'

    within 'b' do
      expect(page).to have_content 'Listing regions'
    end

  end

end