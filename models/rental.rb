require_relative( '../db/sql_runner' )

class Rental

  attr_reader(:prop_id, :tenant_id,:id)

  def initialize( options )
    @id = options['id'].to_i() if options['id']
    @prop_id = options['prop_id'].to_i()
    @tenant_id = options['tenant_id'].to_i()
    @start_date = options['start_date']
  end

  def save()
    sql = "INSERT INTO rentals
    (
      prop_id,
      tenant_id
      start_date
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@prop_id,@tenant_id,@start_date]
    results = SqlRunner.run(sql,values)
    @id = results.first()['id'].to_i()
  end

  def delete()
    sql = "DELETE FROM rentals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def property()
    sql = "SELECT * FROM properties
    WHERE id = $1"
    values = [@prop_id]
    results = SqlRunner.run(sql,values)
    return Property.new(results.first())
  end

  def tenant()
    sql = "SELECT * FROM tenants
    WHERE id = $1"
    values = [@tenant_id]
    results = SqlRunner.run(sql,values)
    return Tenant.new(results.first())
  end

  def find(id)
    sql = "SELECT * FROM rentals WHERE id = $1"
    values = [id]
    rental = SqlRunner.run(sql,values)
    return Rental.new(rental.first())
  end

  def self.all()
    sql = "SELECT * FROM rentals"
    results = SqlRunner.run(sql)
    return results.map() { |rental| Rental.new(rental) }
  end

  def self.find(id)
    sql = "SELECT * FROM rentals WHERE id = $1"
    values = [id]
    rental = SqlRunner.run(sql,values)
    return Rental.new(rental.first())
  end

  def self.delete(id)
    sql = "DELETE FROM rentals
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all()
   sql = "DELETE FROM rentals"
   SqlRunner.run( sql )
 end

end
