module RegionMacros

  def create_region(region = build(:region))
    visit root_path
    click_link 'Configuration'
    click_link 'Regions'
    click_link 'New Region'

    fill_in 'Name', with: region.name
    click_button 'Create Region'
  end

end