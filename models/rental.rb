require_relative( '../db/sql_runner' )

class Rental

  attr_reader(  )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @property_id = options['property_id'].to_i
    @tenant_id = options['tenant_id'].to_i
  end

  # SHOW ALL
  # PROCESS NEW TENANCY
  # TERMINATE EXISTING TENANCY

end
