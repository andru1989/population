require 'rails_helper'

feature 'Person' do

  scenario 'adds a new person' do
    expect{ create_person }.to change(Person, :count).by(1)

    expect(current_path).to eq people_path
    expect(page).to have_content 'Person was successfully created.'

  end

  scenario 'edits a person' do
    create(:person)
    update_person

    expect(current_path).to eq people_path
    expect(page).to have_content 'Person was successfully updated.'
  end

  scenario 'destroy a person' do
    create(:person)
    expect{ destroy_person }.to change(Person, :count).by(-1)

    expect(current_path).to eq people_path
    expect(page).to have_content 'Person was successfully destroyed.'
  end

end