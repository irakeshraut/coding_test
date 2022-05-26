require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

LandChecker::Lga.destroy_all
CSV.foreach(Rails.root.join('db', 'sample_data', 'lgas.csv'), headers: true) do |row|
  puts row.inspect
  LandChecker::Lga.create!(code: row['code'], name: row['name'], long_name: row['long_name'])
end

LandChecker::Property.destroy_all
CSV.foreach(Rails.root.join('db', 'sample_data', 'properties.csv'), headers: true) do |row|
  puts row.inspect
  LandChecker::Property.create!(id: row['id'], lga_code: row['lga_code'], council_property_number: row['council_property_number'], longitude: row['longitude'], latitude: row['latitude'])
end

LandChecker::Address.destroy_all
CSV.foreach(Rails.root.join('db', 'sample_data', 'addresses.csv'), headers: true) do |row|
  puts row.inspect
  LandChecker::Address.create!(feature_id: row['feature_id'], property_id: row['property_id'], full_address: row['full_address'], lga_code: row['lga_code'], state: row['state'], postcode: row['postcode'])
end
