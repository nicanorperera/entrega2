#Un producto tiene un código, un nombre y un precio. Creá una clase llamada Purchase que sea capaz de:

#    Agregar un nuevo producto (#add)
#    Eliminar un nuevo producto (#delete)
#    Calcular el total (#total)
#    Aplicar descuentos (#apply_discount): Los descuentos no son definidos estáticamente sino que pueden crearse y aplicarse dinámicamente. Ejemplos de descuentos son:
#        Si la lista de productos tiene más de 10 productos, se cobra el 20% menos
#        Si la lista de productos tiene más de 3 productos iguales, cada 3 paga 2


require_relative "purchase.rb"

p1 = Product.new '01', 'Martillo', 40
p2 = Product.new '02', 'Clavos x 100', 10

p = Purchase.new
p.add p1
p.add p1
p.add p1
p.add p1
p.add p1
p.add p1
p.add p1
p.add p1
p.add p1
p.add p1
p.add p2


puts "Total sin descuentos:", p.total

# Descuento de 10% en tu compra si llevás algún martillo!
#p.apply_discount do |purchase|
#  hammers = purchase.products.collect { |product| product.code == '01'  }
#  purchase.total -= purchase.total * 0.1 if hammers.any?
#end

p.apply_discount do |purchase|
  purchase.total_prize *= 0.8 if purchase.products.size > 10
end

puts "Total con descuento:", p.total

p.apply_discount do |purchase|
  product_prices = Hash.new
  product_counts = Hash.new( 0 )

  purchase.products.each do |product|
    product_counts[product.code] += 1
    product_prices[product.code] ||= product.prize
  end

  product_counts.each do |k, v|
    if v > 3
      discounted_items = v.div 3
      purchase.total_prize -= discounted_items * product_prices[k]
    end
  end

  
end

puts "Total con descuento 2:", p.total
    

