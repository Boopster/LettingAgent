require_relative( '../db/sql_runner' )

class Property

  attr_reader(  )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @address = options['address']
    @property_type = options['property_type']
    @bedrooms = options['bedrooms'].to_i
    @price_pcm = options['price_pcm'].to_i
  end

  # CREATE NEW
  # DELETE EXISTING
  # DELETE ALL

end
