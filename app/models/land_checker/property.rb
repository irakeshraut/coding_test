module LandChecker
  class Property < ApplicationRecord
    validates :longitude, presence: true
    validates :latitude, presence: true
    validates :lga_code, presence: true

    belongs_to :lga, foreign_key: 'lga_code', primary_key: 'code'
  end
end
