require 'rails_helper'

feature 'City' do

  scenario 'adds a new city' do
    region  = create(:region)
    city    = build(:city, region_id: region.id)
    expect{
      create_city(city)
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

    navigate_cities_index
    click_link('Edit', match: :first)
    fill_in 'Name', with: city.name
    click_button 'Update City'
    expect(current_path).to eq region_cities_path(region)
    expect(page).to have_content 'City was successfully updated.'

    within 'b' do
      expect(page).to have_content 'Listing cities'
    end
  end

  scenario 'destroy a city' do
    region  = create(:region)
    city    = create(:city, region_id: region.id)

    expect{
      navigate_cities_index
      click_link('Destroy', match: :first)
    }.to change(City, :count).by(-1)
    expect(current_path).to eq region_cities_path(region)
    expect(page).to have_content 'City was successfully destroyed.'

    within 'b' do
      expect(page).to have_content 'Listing cities'
    end
  end

end