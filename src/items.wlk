import wollok.game.*
import personaje.*
import cooldownTracker.*

class Item {
	
	var property enCooldown = false
	var property position
	
	method image()
	
	method tiempoDeCooldown()
	method precio()
	
	method inicializarPosicion(posicionDada) {
		position = posicionDada
		game.addVisual(self)
	}
	
	method inicializarTecla(teclaDada) {		
		teclaDada.onPressDo(
			{ self.comprar() }
		)
	}
	
	
	method comprar() {
		if (not self.enCooldown()) {
			self.dispararCooldown()
			self.activar()
		}
	}
	
	method dispararCooldown() {		
		cooldownTracker.agregarItemEnCooldown(self)
	}
	
	method activar()
}

object escudo inherits Item {
	
	override method image() = "items/escudo.png"	
	
	override method tiempoDeCooldown() = 3	
	override method precio() = 30
	
	override method activar() {
		personaje.ponerEscudo()
	}	
}
