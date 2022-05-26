module LandChecker
  class Lga < ApplicationRecord
    validates :code, presence: true
    validates :code, uniqueness: true
    validates :name, presence: true
    validates :long_name, presence: true

    has_many :properties, foreign_key: 'lga_code', primary_key: 'code'
  end
end
