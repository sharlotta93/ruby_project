class Category

attr_accessor :name
attr_reader :id

  def initialize(type)
    @id = type['id'] if type['id']
    @name = type['name']
  end


end
