require_relative( '../db/sql_runner' )

class Property

  attr_reader(:prop_name, :prop_no, :street_name, :town, :postcode, :prop_type, :bedrooms, :price_pcm, :id)

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

  # CREATE NEW LISTING

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

  # UPDATE LISTING

  def update()
    sql = "UPDATE properties
    SET
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
    =
    (
      $1, $2, $3, $4, $5, $6, $7, $8
    )
    WHERE id = $9"
    values = [@prop_name,@prop_no,@street_name,@town,@postcode,@prop_type,@bedrooms,@price_pcm, @id]
    SqlRunner.run( sql, values )
  end

  # DELETE LISTING

  def delete()
    sql = "DELETE FROM properties
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  # SHOW ALL LISTINGS

  def self.all()
    sql = "SELECT * FROM properties"
    results = SqlRunner.run( sql )
    return results.map { |hash| Property.new( hash ) }
  end

  # SHOW

  def self.find( id )
    sql = "SELECT * FROM properties WHERE id = $1"
    values = [id]
    property = SqlRunner.run( sql, values )
    return Property.new( property.first )
  end

  # DELETE EXISTING LISTING
  #
  # def self.delete(id)
  #   sql = "SELECT * FROM properties WHERE id = $1"
  #   values = [id]
  #   SqlRunner.run(sql,values)
  # end

end
