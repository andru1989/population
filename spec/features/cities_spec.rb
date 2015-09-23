require 'rails_helper'

feature 'City' do

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
      expect{ create_city(city) }
    end

    expect(page).to have_content 'Name has already been taken'
  end

  scenario 'edits a city' do
    region  = create(:region)
    city    = create(:city, region_id: region.id)

    expect(update_city)
    expect(current_path).to eq region_cities_path(region)
    expect(page).to have_content 'City was successfully updated.'

    within 'b' do
      expect(page).to have_content 'Listing cities'
    end
  end

  scenario 'destroy a city' do
    region  = create(:region)
    city    = create(:city, region_id: region.id)

    expect{ destroy_city }.to change(City, :count).by(-1)
    expect(current_path).to eq region_cities_path(region)
    expect(page).to have_content 'City was successfully destroyed.'

    within 'b' do
      expect(page).to have_content 'Listing cities'
    end
  end

end