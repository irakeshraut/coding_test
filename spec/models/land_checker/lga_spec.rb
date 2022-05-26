require 'rails_helper'

RSpec.describe LandChecker::Lga, type: :model do
  let(:lga) { LandChecker::Lga.new(code: 311, name: 'CARDINIA', long_name: 'CARDINIA SHIRE') }

  describe 'validations' do
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:long_name) }

    it 'will validate uniqueness of code' do
      lga.save
      lga2 = lga.dup
      expect(lga2).to be_invalid
      expect(lga2.errors.full_messages).to eq(['Code has already been taken'])
    end
  end

  describe 'association' do
    it { should have_many(:properties) }
  end

  context 'valid Lga' do
    it 'will pass validation' do
      expect(lga).to be_valid
    end

    it 'will save valid Lgo to database' do
      expect { lga.save }.to change { LandChecker::Lga.count }.by(1)
    end
  end

  context 'invalid Lga' do
    before { lga.code = nil }

    it 'will fail validation' do
      expect(lga).to be_invalid
    end

    it 'will not save invalid Lga to database' do
      expect { lga.save }.not_to change { LandChecker::Lga.count }
    end
  end
end
