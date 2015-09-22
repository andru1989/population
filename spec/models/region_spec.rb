require 'rails_helper'

describe Region do

  describe 'validations' do
    it { expect validate_presence_of(:name) }
    it { expect validate_uniqueness_of(:name).case_insensitive }
  end

  describe 'associations' do
    it { expect have_many(:cities) }
  end

end