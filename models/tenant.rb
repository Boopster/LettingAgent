require_relative( '../db/sql_runner' )

class Tenant

  attr_reader(  )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @contact_no = options['contact_no']
    @email = options['email']
  end

  # CREATE NEW
  # UPDATE EXISTING
  # DELETE EXISTING
  # DELETE ALL

end
