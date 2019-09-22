require_relative( '../db/sql_runner' )

class Rental

  attr_reader(:prop_id, :tenant_id, :rental_status, :id)

  def initialize( options )
    @id = options['id'].to_i() if options['id']
    @prop_id = options['prop_id'].to_i()
    @tenant_id = options['tenant_id'].to_i()
    @rental_status = options['rental_status']
  end

  def save()
    sql = "INSERT INTO rentals
    (
      prop_id,
      tenant_id,
      rental_status
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    @rental_status = "leased"
    values = [@prop_id,@tenant_id,@rental_status]
    results = SqlRunner.run(sql,values)
    @id = results.first()['id'].to_i()
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

  def self.all()
    sql = "SELECT * FROM rentals"
    results = SqlRunner.run(sql)
    return results.map() { |rental| Rental.new(rental) }
  end

  def self.delete(id)
    sql = "DELETE FROM rentals
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql,values)
  end

end
