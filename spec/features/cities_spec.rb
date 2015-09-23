require 'rails_helper'

feature 'City creation' do

  scenario 'adds a new city' do
    region = create(:region)
    expect{
      create_region(region)
      create_city
    }.to change(City, :count).by(1)

    expect(current_path).to eq region_cities_path(region)
    expect(page).to have_content 'City was successfully created.'

    within 'b' do
      expect(page).to have_content 'Listing cities'
    end
  end

  scenario 'try to add a duplicate city' do
    city    = build(:city, name: 'Medellin')
    region  = create(:region, name: 'Antioquia')

    create_region(region)
    2.times do
      expect{
        create_city(city)
      }
    end

    expect(page).to have_content 'Name has already been taken'
  end

end