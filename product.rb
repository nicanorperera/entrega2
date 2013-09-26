# Un producto tiene un código, un nombre y un precio. 
class Product

  attr_reader :code, :name
  attr_accessor :prize

  def initialize(code, name, prize)
    @code = code
    @name = name
    @prize = prize
  end

end
