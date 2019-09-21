require_relative( '../db/sql_runner' )

class Property

  attr_reader(  )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @prop_name = options['prop_name']
    @prop_no = options['prop_no'].to_i()
    @street_name = options['street_name']
    @town = options['town']
    @postcode = options['postcode']
    @prop_type = options['prop_type']
    @bedrooms = options['bedrooms'].to_i()
    @price_pcm = options['price_pcm'].to_i()
  end

  # CREATE NEW

  def save()
    sql = "INSERT INTO properties
    (
      prop_name,
      prop_no,
      street_name,
      town,
      postcode,
      prop_type,
      bedrooms,
      price_pcm
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7, $8
    )
    RETURNING id"
    values = [@prop_name,@prop_no,@street_name,@town,@postcode,@prop_type,@bedrooms,@price_pcm]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  # DELETE EXISTING
  # DELETE ALL

end
