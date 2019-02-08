require('pg')
require_relative('../db/sql_runner')

class Product

  attr_reader :id
  attr_accessor :name, :unit, :min_units_required, :buying_cost, :selling_price, :description, :type_id, :supplier_id

  def initialize(product)
    @id = product['id'].to_i if product['id']
    @name = product['name']
    @unit = product['unit']
    @min_units_required = product['min_units_required'].to_i
    @buying_cost = product['buying_cost'].to_f
    @selling_price = product['selling_price'].to_f
    @description = product['description']
    @type_id = product['type_id'].to_i
    @supplier_id = product['supplier_id'].to_i
  end

  def save()
    sql = "INSERT INTO products
          (name, unit, min_units_required, buying_cost, selling_price, description, type_id, supplier_id)
          VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
          RETURNING id"
    values = [@name, @unit, @min_units_required, @buying_cost, @selling_price, @description, @type_id, @supplier_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "SELECT * FROM products WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM products WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all()
    sql = "DELETE FROM products"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM products
           WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Supplier.new( results.first )
  end

  def self.all()
    sql = "SELECT * FROM products"
    result = SqlRunner.run(sql).first
    return result.map{ |product| Product.new(product)}
  end

end
