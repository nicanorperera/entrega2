# Clase llamada Purchase capaz de:
#   Agregar un nuevo producto (#add)
#   Eliminar un nuevo producto (#delete)
#   Calcular el total (#total)
#   Aplicar descuentos (#apply_discount)
#   Los descuentos no son definidos estáticamente sino que pueden crearse y aplicarse dinámicamente. 
#   Ejemplos de descuentos son:
#     Si la lista de productos tiene más de 10 productos, se cobra el 20% menos
#     Si la lista de productos tiene más de 3 productos iguales, cada 3 paga 2


require_relative "product.rb"

class Purchase

  attr_reader :products
  attr_accessor :total_prize

  def initialize
    @products = []
    @total_prize = 0
    @discounts = []
  end

  def add(product)
    @products << product
  end

  def delete(product)
    @products.delete(product)
  end

  def total
    @total_prize = @products.map {|p| p.prize }.inject :+
    @discounts.each do |discount|
      discount.call self
    end
    @total_prize
  end

  def apply_discount(&block)
    @discounts << block
  end
  
end
