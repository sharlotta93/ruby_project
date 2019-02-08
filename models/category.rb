require_relative( '../db/sql_runner' )

class Category

attr_accessor :name
attr_reader :id

  def initialize(type)
    @id = type['id'].to_i if type['id']
    @name = type['name']
  end


end
