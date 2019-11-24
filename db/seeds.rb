require_relative( "../models/property.rb" )
require_relative( "../models/tenant.rb" )
require_relative( "../models/rental.rb" )
require("pry-byebug")

Rental.delete_all()
Property.delete_all()
Tenant.delete_all()

property1 = Property.new({
  "prop_name" => "Flat 1",
  "prop_no" => 10,
  "street_name" => "Ruby Road",
  "town" => "Rubyville",
  "postcode" => "R1 1RR",
  "prop_type" => "Flat/Apartment",
  "bedrooms" => 2,
  "price_pcm" => 600
})

property1.save()

property2 = Property.new({
  "prop_name" => "Flat 2",
  "prop_no" => 10,
  "street_name" => "Ruby Road",
  "town" => "Rubyville",
  "postcode" => "R1 1RR",
  "prop_type" => "Flat/Apartment",
  "bedrooms" => 2,
  "price_pcm" => 600
})

property2.save()

property3 = Property.new({
  "prop_name" => "Ruby View",
  "prop_no" => 20,
  "street_name" => "Ruby Lane",
  "town" => "Rubyville",
  "postcode" => "R2 1RL",
  "prop_type" => "Semi-detached",
  "bedrooms" => 3,
  "price_pcm" => 800
})

property3.save()

property4 = Property.new({
  "prop_name" => "Ruby House",
  "prop_no" => 25,
  "street_name" => "Ruby Lane",
  "town" => "Rubyville",
  "postcode" => "R2 1RL",
  "prop_type" => "Detached",
  "bedrooms" => 5,
  "price_pcm" => 1200
})

property4.save()

tenant1 = Tenant.new({
  "first_name" => "Becky",
  "last_name" => "Still",
  "contact_no" => "0123 456 7890",
  "email" => "becky@email.com"
})

tenant1.save()

tenant2 = Tenant.new({
  "first_name" => "Lily-Rose",
  "last_name" => "Sharp",
  "contact_no" => "0234 567 8901",
  "email" => "lil_rox@email.com"
})

tenant2.save()

tenant3 = Tenant.new({
  "first_name" => "Jeanne",
  "last_name" => "Wightman",
  "contact_no" => "0345 678 9012",
  "email" => "jean_the_queen@email.com"
})

tenant3.save()

tenant4 = Tenant.new({
  "first_name" => "Mairi",
  "last_name" => "Beaton",
  "contact_no" => "0456 789 0123",
  "email" => "mazzabee@email.com"
})

tenant4.save()

# binding.pry
# nil
