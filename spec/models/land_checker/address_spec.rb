require 'rails_helper'

RSpec.describe LandChecker::Address, type: :model do
  let!(:lga) { LandChecker::Lga.create!(code: 311, name: 'CARDINIA', long_name: 'CARDINIA SHIRE') }
  let!(:property) { LandChecker::Property.create!(longitude: 134.3222, latitude: -39.1222, lga_code: 311) }
  let(:address) { LandChecker::Address.new(feature_id: 111, property_id: property.id, full_address: 'test, test, vic, 3071', lga_code: 333, state: 'VIC', postcode: 3071) }

  describe 'validations' do
    it { should validate_presence_of(:feature_id) }
    it { should validate_presence_of(:property_id) }
    it { should validate_presence_of(:full_address) }
    it { should validate_presence_of(:lga_code) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:postcode) }
  end

  describe 'association' do
    it { should belong_to(:property) }
  end

  context 'valid Address' do
    it 'will pass validation' do
      expect(address).to be_valid
    end

    it 'will save valid Address to database' do
      expect { address.save }.to change { LandChecker::Address.count }.by(1)
    end
  end

  context 'invalid Address' do
    before { address.feature_id = nil }

    it 'will fail validation' do
      expect(address).to be_invalid
    end

    it 'will not save invalid Address to database' do
      expect { address.save }.not_to change { LandChecker::Address.count }
    end
  end
end
