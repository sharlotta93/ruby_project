require_relative( '../db/sql_runner' )

class Category

attr_accessor :name
attr_reader :id

  def initialize(type)
    @id = type['id'].to_i if type['id']
    @name = type['name']
  end

  def save()
    sql = "INSERT INTO categories
          (name) VALUES ($1)
          RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "SELECT * FROM categories WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM categories WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.find(id)
    sql = "SELECT * FROM categories
          WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Category.new( results.first )
  end

  def self.delete_all()
    sql = "DELETE FROM categories"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM categories"
    result = SqlRunner.run(sql).first
    return result.map{ |type| Category.new(type)}
  end

end
