require 'rails_helper'

feature 'Region creation' do
  scenario 'adds a new region' do

    expect { create_region }.to change(Region, :count).by(1)

    expect(current_path).to eq regions_path
    expect(page).to have_content 'Region was successfully created.'

    within 'b' do
      expect(page).to have_content 'Listing regions'
    end

  end

  scenario 'try to add a duplicate region' do
    region = build(:region, name: 'Antioquia')

    2.times do
      create_region(region)
    end

    expect(page).to have_content 'Name has already been taken'
  end

  scenario 'edits a region' do
    region = create(:region)
    navigate_regions_index
    click_link('Edit', match: :first)
    fill_fields(region)

    click_button 'Update Region'

    expect(current_path).to eq regions_path
    expect(page).to have_content 'Region was successfully updated.'
  end

  scenario 'destroy a region' do
    create(:region)
    expect{
      navigate_regions_index
      click_link('Destroy', match: :first)
    }.to change(Region, :count).by(-1)

    expect(current_path).to eq regions_path
    expect(page).to have_content 'Region was successfully destroyed.'
  end

end