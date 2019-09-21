DROP TABLE rentals;
DROP TABLE properties;
DROP TABLE tenants;

CREATE TABLE properties
(
  id SERIAL8 PRIMARY KEY,
  address VARCHAR(255) not null,
  property_type VARCHAR(255) not null,
  bedrooms INT2,
  price_pcm INT4
);

CREATE TABLE tenants
(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255) not null,
  last_name VARCHAR(255) not null,
  contact_no VARCHAR(11) not null,
  email VARCHAR(255) not null
);

CREATE TABLE rentals
(
  id SERIAL8 PRIMARY KEY,
  property_id INT8 REFERENCES properties(id),
  tenant_id INT8 REFERENCES tenants(id)
);
