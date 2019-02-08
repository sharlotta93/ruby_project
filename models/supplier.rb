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
    results = Sqlrunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE suppliers SET (name, payment_method) = ($1, $2) WHERE id = $3"
    values = [@name, @payment_method, @id]
    Sqlrunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM suppliers WHERE id = $1"
    values = [@id]
    Sqlrunner.run(sql,values)
  end

  def self.delete_all()
    sql = "DELETE FROM suppliers"
    Sqlrunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM suppliers
           WHERE id = $1"
    values = [id]
    results = Sqlrunner.run( sql, values )
    return Supplier.new( results.first )
  end

  def self.all()
    sql = "SELECT * FROM suppliers"
    result = Sqlrunner.run(sql)
    return result.map{ |seller| Supplier.new(seller)}
  end

end
