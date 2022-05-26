module LandChecker
  class Address < ApplicationRecord
    validates :feature_id, presence: true
    validates :property_id, presence: true
    validates :full_address, presence: true
    validates :lga_code, presence: true
    validates :state, presence: true
    validates :postcode, presence: true

    belongs_to :property
  end
end
