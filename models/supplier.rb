require('pg')
require_relative('../db/sql_runner')

class Supplier

  attr_reader :id
  attr_accessor :name, :payment_method

  def initialize(seller)
    @id = seller['id'].to_i if seller['id']
    @name = seller['name']
    @payment_method = seller['payment_method']
  end

  def save()
    sql = "INSERT INTO suppliers
          (name, payment_method) VALUES ($1, $2)
          RETURNING id"
    values = [@name, @payment_method]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "SELECT * FROM suppliers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM suppliers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all()
    sql = "DELETE FROM suppliers"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM suppliers
           WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Supplier.new( results.first )
  end

  def self.all()
    sql = "SELECT * FROM suppliers"
    result = SqlRunner.run(sql).first
    return result.map{ |seller| Supplier.new(seller)}
  end

end
