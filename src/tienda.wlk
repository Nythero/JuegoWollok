import configuracion.*
import wollok.game.*
import items.*

object tienda {

	const item1 = new ItemDePrueba()
	const item2 = new ItemDePrueba()
	const item3 = new ItemDePrueba()
	const item4 = new ItemDePrueba()
	const item5 = new ItemDePrueba()
	const item6 = new ItemDePrueba()
	
	const items = [escudo]
	
	const ancho = 3
	const alto = 2
	
	const posicion = game.at(configuracion.gameWidth() - 1 - ancho, alto)
	
	method comprar(item) {
		items.get(item).comprar()
	}
	
	method inicializar() {
		var n = 0
		
		items.forEach({
			item =>
				game.addVisualIn(item, self.slot(n))
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
		return posicion.y() - n.div(ancho)
	}
	
	method coordSlotX(n) {
		return posicion.x() + n % ancho
	}
}

class ItemDePrueba {
	
	var property image = "items/escudo.png"
}