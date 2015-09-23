require 'rails_helper'

describe PersonDecorator do

  let(:person) { build(:person) }
  let(:person_nil) { build(:person, name: nil, last_name:nil) }

  describe '#full_name' do

    context 'when name and last_name are filled' do
      it 'returns name and last_name joined' do
        expect(person.full_name).to eq [person.name, person.last_name].join(' ')
      end
    end

    context 'when name and last_name are nil' do
      it 'returns a nil string' do
        expect(person_nil.full_name).to eq ' '
      end
    end

  end

end