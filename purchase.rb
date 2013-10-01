# Clase llamada Purchase capaz de:
#   Agregar un nuevo producto (#add)
#   Eliminar un nuevo producto (#delete)
#   Calcular el total (#total)
#   Aplicar descuentos (#apply_discount)
#   Los descuentos no son definidos estáticamente sino que pueden crearse y aplicarse dinámicamente. 

Product = Struct.new(:code, :name, :prize)

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

  # Los descuentos se aplican dinamicamente cada vez que se llama a este metodo.
  def total
    # Calculo el total sin descuentos
    self.total_prize = @products.map {|p| p.prize }.inject :+

    # Aplico todos los descuentos dinamicamente
    @discounts.each do |discount|
      discount.call self
    end

    self.total_prize # Retorno el precio final
  end

  def apply_discount(&block)
    @discounts << block
  end

  # Agregado para poder eliminar descuentos.
  def reset_discounts
    @discounts = []
  end
  
end