require_relative( "../models/property.rb" )
require_relative( "../models/tenant.rb" )
require_relative( "../models/rental.rb" )
require("pry-byebug")

property1 = Property.new({
  "prop_name" => "Flat 12B",
  "prop_no" => 2,
  "street_name" => "Ruby Street",
  "town" => "Glasgow",
  "postcode" => "G1 1RB",
  "prop_type" => "Flat",
  "bedrooms" => 2,
  "price_pcm" => 800
})

property1.save()

binding.pry
nil
