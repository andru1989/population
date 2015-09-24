module CityMacros

  def create_city(city = build(:city))
    navigate_cities_index

    click_link 'New City'
    fill_in 'Name', with: city.name
    click_button 'Create City'
  end

  def navigate_cities_index
    visit root_path
    click_link 'Configuration'
    click_link 'Regions'
    click_link("Cities", match: :first)
  end

end