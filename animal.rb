module Caminador

  def caminar
    puts "Estoy caminando y soy un #{self}"
  end

end


module Nadador

  def nadar
    puts "Estoy nadando y soy un #{self}"
  end

end


module Volador

  def volar
    puts "Estoy volando y soy un #{self}"
  end

end


module Desplazador
  
  def desplazar
    puts "Estoy desplazandome y soy un #{self}"
  end

end

#En el reino animal hay diferentes grupos de animales, entre los que encontramos, por ejemplo, a los mamíferos, las aves, los reptiles y los anfibios y los peces
Animal = Class.new

# Entre los mamíferos encontramos al hombre, que es capaz de caminar, nadar, y hablar.
# Al perro que es capaz de caminar y ladrar.
# Y a la ballena, que es capaz de nadar.
class Mamifero < Animal

  def amamantar 
    puts "Estoy amamantando a mi cria y soy un #{self}"
  end

end


class Hombre < Mamifero

  include Caminador
  include Nadador

  def hablar 
    puts "Estoy hablando y soy un #{self}"
  end
end


class Perro < Mamifero
  
  include Caminador

  def ladrar 
    puts "Estoy hablando y soy un #{self}"
  end

end

class Ballena < Mamifero
  include Nadador
end

# Entre las aves encontramos al águila, que es capaz de volar y caminar
# Y al pingüino, que es capaz de caminar y nadar.
class Ave < Animal
  include Caminador
end

class Aguila < Ave
  include Volador
end

class Pinguino < Ave
  include Nadador
end

# Entre los reptiles encontramos al cocodrilo, que es capaz de caminar y nadar, 
# La boa, que es capaz de desplazarse y ejercer presión (constricción) y 
# La cobra que es capaz de desplazarse y morder
Reptil = Class.new(Animal)

class Cocodrilo < Reptil
  include Caminador
  include Nadador
end

class Boa < Reptil
  include Desplazador
  def presionar
    puts "Estoy matando a mi presa mediante constriccion y soy un #{self}"
  end
end

class Cobra < Reptil
  include Desplazador
  def morder
    puts "Estoy matando a mi presa mediante mi mordedura venenoza y soy un #{self}"
  end
end
# Entre los anfibios encontramos a los sapos que son capaces de saltar y nadar.
Anfibio = Class.new(Animal)

class Sapo < Anfibio
  include Nadador
  def saltar
    puts "Estoy saltando y soy un #{self}"
  end
end

# Entre los peces encontramos a los tiburones que son capaces de nadar.
class Pez < Animal
  include Nadador
end

Tiburon = Class.new(Pez)