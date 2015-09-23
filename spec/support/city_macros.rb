module CityMacros

  def create_city(city = build(:city))
    visit root_path
    click_link 'Configuration'
    click_link 'Regions'
    click_link("Cities", match: :first)

    click_link 'New City'
    fill_in 'Name', with: city.name
    click_button 'Create City'
  end

end