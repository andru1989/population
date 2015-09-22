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

    expect( create_region(region) )
    expect( create_region(region) )
    expect(page).to have_content 'Name has already been taken'

  end

end