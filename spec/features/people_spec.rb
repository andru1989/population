require 'rails_helper'

feature 'Person' do

  scenario 'adds a new person' do
    expect{ create_person }.to change(Person, :count).by(1)

    expect(current_path).to eq people_path
    expect(page).to have_content 'Person was successfully created.'

  end

  scenario 'try to add a person with a duplicate identification' do
    person = build(:person, identification: '10373737')

    2.times do
      expect(create_person(person))
    end

    expect(page).to have_content 'Identification has already been taken'
  end

  scenario 'edits a person' do
    person = create(:person)
    visit people_path
    click_link("Edit", match: :first)

    fill_fields(person)

    click_button 'Update Person'

    expect(current_path).to eq people_path
    expect(page).to have_content 'Person was successfully updated.'
  end

  scenario 'destroy a person' do
    create(:person)
    expect{
      visit people_path
      click_link("Destroy", match: :first)
    }.to change(Person, :count).by(-1)

    expect(current_path).to eq people_path
    expect(page).to have_content 'Person was successfully destroyed.'
  end

end