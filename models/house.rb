require_relative('../db/sql_runner')

class House

  attr_reader :house_type, :id

  def initialize(options)
    @house_type = options['house_type']
    @id = options['id'].to_i
  end

  def save()
    sql = "INSERT INTO houses
    (
      house_type
    )
    VALUES
    (
      $1
    )
    RETURNING *"
    values = [@house_type]
    house_data = SqlRunner.run(sql, values)
    @id = house_data.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM houses"
    values = []
    houses = SqlRunner.run( sql, values )
    result = houses.map { |house| House.new( house ) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM houses
    WHERE id = $1"
    values = [id]
    house = SqlRunner.run( sql, values )
    result = House.new( house.first )
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM houses "
    values = []
    SqlRunner.run( sql, values )
  end



end
