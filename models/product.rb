require('pg')
require_relative('../db/sql_runner')

class Product

  attr_reader :id
  attr_accessor :name, :unit, :min_units_required, :buying_cost, :selling_price, :description, :category_id, :supplier_id

  def initialize(product)
    @id = product['id'].to_i if product['id']
    @name = product['name']
    @unit = product['unit'].to_i
    @min_units_required = product['min_units_required'].to_i
    @buying_cost = product['buying_cost'].to_f
    @selling_price = product['selling_price'].to_f
    @description = product['description']
    @category_id = product['category_id'].to_i
    @supplier_id = product['supplier_id'].to_i
  end

  def calc_mark_up()
    mark_up = @selling_price - @buying_cost
    return mark_up.to_f
  end

  def stock_level()
    stock_level = 0
    if @unit == 0
      stock_level = 'out of stock'
    elsif
      @unit <= @min_units_required
      stock_level = 'low'
    elsif
      @unit <= (@min_units_required * 2)
      stock_level = 'medium'
    else
      stock_level = 'high'
    end
  end

  def supplier()
    supplier = Supplier.find(@supplier_id)
    return supplier.name
  end

  def category()
    category = Category.find(@category_id)
    return category.name
  end

  def save()
    sql = "INSERT INTO products
          (name, unit, min_units_required, buying_cost, selling_price, description, category_id, supplier_id)
          VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
          RETURNING id"
    values = [@name, @unit, @min_units_required, @buying_cost, @selling_price, @description, @category_id, @supplier_id]
    results = Sqlrunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE products SET
          (name, unit, min_units_required, buying_cost, selling_price, description, category_id, supplier_id)
          =
          ($1, $2, $3, $4, $5, $6, $7, $8)
          WHERE id = $9"
    values = [@name, @unit, @min_units_required, @buying_cost, @selling_price, @description, @category_id, @supplier_id, @id]
    Sqlrunner.run(sql, values)
  end

  def self.delete(id)
    sql = "DELETE FROM products WHERE id = $1"
    values = [id]
    Sqlrunner.run(sql,values)
  end

  def self.delete_all()
    sql = "DELETE FROM products"
    Sqlrunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM products
           WHERE id = $1"
    values = [id]
    results = Sqlrunner.run( sql, values )
    return Product.new( results.first )
  end

  def self.all()
    sql = "SELECT * FROM products"
    result = Sqlrunner.run(sql)
    return result.map {|products| Product.new(products)}
  end

  def self.by_supplier(supplier_id)
    sql = "SELECT * FROM products
           WHERE supplier_id = $1"
    values = [supplier_id]
    result = Sqlrunner.run(sql, values)
    return result.map { |products| Product.new(products)}
  end

  def self.by_category(category_id)
    sql = "SELECT * FROM products
           WHERE category_id = $1"
    values = [category_id]
    result = Sqlrunner.run(sql, values)
    return result.map { |products| Product.new(products)}
  end

end
