require 'rails_helper'

RSpec.describe LandChecker::Property, type: :model do
  let!(:lga)     { LandChecker::Lga.create!(code: 311, name: 'CARDINIA', long_name: 'CARDINIA SHIRE') }
  let(:property) { LandChecker::Property.new(longitude: 134.3222, latitude: -39.1222, lga_code: 311) }

  describe 'validations' do
    it { should validate_presence_of(:longitude) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:lga_code) }
  end

  describe 'associations' do
    it { should belong_to(:lga) }
    it { should have_one(:address) }
  end

  context 'valid Property' do
    it 'will pass validation' do
      expect(property).to be_valid
    end

    it 'will save valid Property to database' do
      expect { property.save }.to change { LandChecker::Property.count }.by(1)
    end
  end

  context 'invalid Property' do
    before { property.longitude = nil }

    it 'will fail validation' do
      expect(property).to be_invalid
    end

    it 'will not save invalid Property to database' do
      expect { property.save }.not_to change { LandChecker::Property.count }
    end
  end
end
