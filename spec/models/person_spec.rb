require 'rails_helper'

describe Person do

  describe 'validations' do
    it { expect validate_presence_of(:identification_type) }
    it { expect validate_presence_of(:identification) }
    it { expect validate_presence_of(:name) }
    it { expect validate_presence_of(:last_name) }
    it { expect validate_presence_of(:city_id) }

    it { expect validate_uniqueness_of(:identification).case_insensitive }
  end

  describe 'associations' do
    it { expect belong_to(:city) }
  end

  let(:person) { build(:person) }

  describe '.identification_types enum' do

    context 'when identification_type is filled' do
      it 'returns identification_card if identification_type is 0' do
        person.identification_type = 0
        expect(person.identification_type).to eq 'identification_card'
      end

      it 'returns passport if identification_type is 1' do
        person.identification_type = 1
        expect(person.identification_type).to eq 'passport'
      end
    end

    context 'when identification_type is not filled' do
      it 'returns nil if identification_type is nil' do
        person.identification_type = nil
        expect(person.identification_type).to eq nil
      end
    end

  end

  describe '.genders enum' do

    context 'when gender is filled' do
      it 'returns male if gender is 0' do
        person.gender = 0
        expect(person.gender).to eq 'male'
      end

      it 'returns female if gender is 1' do
        person.gender = 1
        expect(person.gender).to eq 'female'
      end
    end

  end

end