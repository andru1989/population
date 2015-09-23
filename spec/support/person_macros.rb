module PersonMacros

  def create_person(person = build(:person))
    visit people_path
    click_link 'New Person'

    fill_fields(person)

    click_button 'Create Person'
  end

  def fill_fields(person)
    find("#person_identification_type option[value=#{person.identification_type}]").select_option
    fill_in 'Identification', with: person.identification
    fill_in 'Name', with: person.name
    fill_in 'Last name', with: person.last_name
    find('#person_city_id option:last').select_option
  end

end