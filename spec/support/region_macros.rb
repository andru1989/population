module RegionMacros

  def create_region(region = build(:region))
    navigate_regions_index
    click_link 'New Region'

    fill_in 'Name', with: region.name
    click_button 'Create Region'
  end

  def update_region(region = build(:region))
    navigate_regions_index
    click_link('Edit', match: :first)

    fill_in 'Name', with: region.name

    click_button 'Update Region'
  end

  def destroy_region
    navigate_regions_index
    click_link('Destroy', match: :first)
  end

  def navigate_regions_index
    visit root_path
    click_link 'Configuration'
    click_link 'Regions'
  end

end