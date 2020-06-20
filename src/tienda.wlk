import configuracion.*
import wollok.game.*
import logica.timer.*
import items.*

object tienda {
	// Para agregar un item a la tienda, solo hace falta agregarlo a esta lista	
	// Se pueden agregar hasta 9 items (correspondiendose en orden con los numeros del
	// teclado del 1 al 9)
	const items = [escudo]
	
	const width = 5
	const height = 2
	
	const property position = game.at(configuracion.gameWidth() - width, height - 1)
	
	method start() {		
		var n = 0
		
		items.forEach( {
			item =>
				item.endCooldown()
				item.startDisplay(self.slot(n))
				item.startKey(keyboard.num(n + 1))
				n++
			}
		)
	}
	
	// La tienda se vizualiza como un "rectangulo" que tiene slots numerados,
	// arrancando desde el cero en su esquina superior izquierda, y contando hacia la
	// derecha y luego hacia abajo
	method slot(n) {
		return game.at(self.coordSlotX(n), self.coordSlotY(n))
	}
	
	method coordSlotY(n) {
		return position.y() - n.div(width)
	}
	
	method coordSlotX(n) {
		return position.x() + n % width
	}
}