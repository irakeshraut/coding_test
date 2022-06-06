json.array! @properties do |property|
  json.property_id property.id
  json.council property.lga.name
  json.council_property_number property.council_property_number ? property.council_property_number.to_s : nil
  json.full_address property.address.full_address
  json.latitude property.latitude.to_d
  json.lga_code property.lga_code
  json.longitude property.longitude
  json.postcode property.address.postcode.to_s
end
