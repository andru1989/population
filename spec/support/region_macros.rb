module RegionMacros

  def create_region(region = build(:region))
    navigate_regions_index
    click_link 'New Region'

    fill_fields(region)
    click_button 'Create Region'
  end

  def fill_fields(region)
    fill_in 'Name', with: region.name
  end

  def navigate_regions_index
    visit root_path
    click_link 'Configuration'
    click_link 'Regions'
  end

end