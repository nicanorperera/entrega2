# Comando para ejecutar: `ruby ejercicio2.rb`
# Inicializa una compra (Purchase) y aplica los descuentos de prueba pedidos.

require_relative "purchase.rb"

p1 = Product.new '01', 'Martillo', 80
p2 = Product.new '02', 'Clavos x 100', 50

p = Purchase.new
10.times do 
  p.add p1
end

4.times do
  p.add p2
end

puts "Total sin descuentos:", p.total

# We apply the first discount: "Si la lista de productos tiene más de 10 productos, se cobra el 20% menos"
p.apply_discount do |purchase|
  purchase.total_prize *= 0.8 if purchase.products.size > 10
end

p.reset_discounts

# Or it can be applied like this:
veinte_por_ciento = -> (purchase) { purchase.total_prize *= 0.8 if purchase.products.size > 10 }
p.apply_discount &veinte_por_ciento 

puts "Total con descuento de veinte por ciento:", p.total

# We apply second discount: "Si la lista de productos tiene más de 3 productos iguales, cada 3 paga 2"
p.apply_discount do |purchase|
  product_prices = {}
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

puts "Total con descuento 3x2:", p.total    

p.reset_discounts

puts "Total sin descuentos:", p.total

p.apply_discount &veinte_por_ciento 

puts "Total con descuento de veinte_por_ciento:", p.total