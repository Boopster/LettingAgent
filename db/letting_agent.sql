DROP TABLE rentals;
DROP TABLE properties;
DROP TABLE tenants;

CREATE TABLE properties
(
  id SERIAL8 PRIMARY KEY,
  prop_name VARCHAR(255),
  prop_no INT2,
  street_name VARCHAR(255),
  town VARCHAR(255),
  postcode VARCHAR(255),
  prop_type VARCHAR(255),
  bedrooms INT2,
  price_pcm INT2
);

CREATE TABLE tenants
(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  contact_no VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE rentals
(
  id SERIAL8 PRIMARY KEY,
  prop_id INT8 REFERENCES properties(id),
  tenant_id INT8 REFERENCES tenants(id),
  rental_status VARCHAR(255)
);
