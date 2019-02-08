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


end
