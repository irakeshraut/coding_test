require 'rails_helper'

RSpec.describe "Api::V1::Properties", type: :request do
  let!(:lga)      { LandChecker::Lga.create!(code: 311, name: 'CARDINIA', long_name: 'CARDINIA SHIRE') }
  let!(:property) { LandChecker::Property.create!(id: 111, longitude: 134.3222, latitude: -39.1222, lga_code: 311, council_property_number: 23456) }
  let!(:address)  { LandChecker::Address.create!(feature_id: 111, property_id: property.id, full_address: 'test, test, vic, 3071', lga_code: 333, state: 'VIC', postcode: 3071) }

  describe "GET /index" do
    before do
      get api_v1_properties_path
      @parsed_response = JSON.parse(response.body, symbolize_names: true)
    end

    it 'response code will be 200' do
      expect(response.code).to eq('200') 
    end

    it 'will have one property detail in an array' do
      expect(@parsed_response.count).to eq(1)
    end

    it 'will have property details in json' do
      expected_result = { council: "CARDINIA", council_property_number: 23456, full_address: "test, test, vic, 3071", latitude: "-39.1222", lga_code: 311, longitude: "134.3222", postcode: 3071, property_id: 111 }
      expect(@parsed_response.first).to eq(expected_result)
    end
  end
end
