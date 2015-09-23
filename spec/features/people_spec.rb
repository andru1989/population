require 'rails_helper'

feature 'Person' do

  scenario 'adds a new person' do
    expect{
      person = build(:person)
      visit people_path
      click_link 'New Person'

      fill_fields(person)

      click_button 'Create Person'
    }.to change(Person, :count).by(1)

    expect(current_path).to eq people_path
    expect(page).to have_content 'Person was successfully created.'

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