# Entrega 2

## Forma de entrega

Crear un repositorio en GitHub con los ejercicios y hacer un PR en el sandbox
dentro del directorio entrega2 con el nombre de usuario de github y dentro de
ese archivo, el nombre del repositorio. Por ejemplo, el usuario
`patriciomacadden` crearía el archivo `entrega2/patriciomacadden` con el
siguiente contenido (suponiendo que el repositorio se llama
`patriciomacadden/entrega2`):

```
patriciomacadden/entrega2
```

Además, subir al moodle un archivo `tar.gz` o `zip` que contenga los ejercicios.

**RECORDAR**: Antes de hacer un pull request deben estar actualizados!

```bash
$ git checkout master
$ git pull upstream master
$ git push origin master
```

Y luego hacer el pull request (Usar branches!). Si ya hiciste el PR, obvia este paso.

### Criterios de aprobación

* **Crítico**: El código debe compilar
* **Crítico**: El código debe poder ejecutar los casos de prueba
* **Crítico**: Entregar en tiempo y forma: Hasta el 01/10/2013 a las 23:55hs.
* **Crítico**: Entregar los casos de prueba
* **Conceptual**: El código debe seguir los [Coding Standards](https://github.com/bbatsov/ruby-style-guide)

### Notas

* No se aceptarán pull requests que no agreguen solo el archivo que se espera
* No se aceptarán pull requests que incluyan commits de otros usuarios

## Ejercicio 1

En el reino animal hay diferentes grupos de animales, entre los que
encontramos, por ejemplo, a los mamíferos, las aves, los reptiles y los
anfibios y los peces. Entre los mamíferos encontramos al hombre, que es capaz
de caminar, nadar, y hablar, al perro que es capaz de caminar y ladrar y a la
ballena, que es capaz de nadar. Entre las aves encontramos al águila, que es
capaz de volar y caminar, y al pingüino, que es capaz de caminar y nadar.
Entre los reptiles encontramos al cocodrilo, que es capaz de caminar y nadar,
la boa, que es capaz de desplazarse y ejercer presión (constricción) y la
cobra que es capaz de desplazarse y morder. Entre los anfibios encontramos a
los sapos que son capaces de saltar y nadar, por último, entre los peces
encontramos a los tiburones que son capaces de nadar. 

Expresá en objetos!

### Casos de prueba

* Instanciar un hombre y pedirle que camine
* Instanciar un hombre y pedirle que hable
* Instanciar un sapo y pedirle que salte
* Instanciar un águila y pedirle que vuele
* Instanciar un perro y pedirle que vuele (Debe fallar)

## Ejercicio 2

Un producto tiene un código, un nombre y un precio. Creá una clase llamada
`Purchase` que sea capaz de:
* Agregar un nuevo producto (`#add`)
* Eliminar un nuevo producto (`#delete`)
* Calcular el total (`#total`)
* Aplicar descuentos (`#apply_discount`): Los descuentos no son definidos
estáticamente sino que pueden crearse y aplicarse dinámicamente. Ejemplos
de descuentos son:
  * Si la lista de productos tiene más de 10 productos, se cobra el 20% menos
  * Si la lista de productos tiene más de 3 productos iguales, cada 3 paga 2

### Nota

* Hay que implementar los dos descuentos de ejemplo.

### Caso de prueba

* Instanciación básica

```ruby
p1 = Product.new '01', 'Martillo', '50'
p2 = Product.new '02', 'Clavos x 100', '10'

p = Purchase.new
p.add p1
p.add p2

p.total
# => 60

# Descuento de 10% en tu compra si llevás algún martillo!
p.apply_discount do |purchase|
  hammers = purchase.products.collect { |product| product.code == '01' }
  purchase.total -= purchase.total * 0.1 if hammers.any?
end

p.total
# => 54.0
```

* Prueba con los descuentos de ejemplo