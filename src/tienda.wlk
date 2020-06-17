import configuracion.*
import wollok.game.*
import logica.timer.*
import items.*

object tienda {
	// Para agregar un item a la tienda, solo hace falta agregarlo a esta lista	
	// Se pueden agregar hasta 9 items (correspondiendose en orden con los numeros del
	// teclado del 1 al 9)
	const items = [escudo]
	
	const ancho = 5
	const alto = 1
	
	const posicion = game.at(configuracion.gameWidth() - ancho, alto)
	
	method inicializar() {		
		cooldownTracker.start()
		
		var n = 0
		
		items.forEach({
			item =>
				item.inicializarPosicion(self.slot(n))
				item.inicializarTecla(keyboard.num(n + 1))
				item.turnOffTiming()
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