import wollok.game.*
import personaje.*
import cooldownTracker.*
import magnitudes.*

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
	
	method desactivarCooldown() {
		enCooldown = false
	}
	
	
	method comprar() {
		if (self.puedeSerComprado() && not self.enCooldown()) {
			self.cobrar()
			self.dispararCooldown()
			self.activar()
		}
	}
	
	method puedeSerComprado() {
		return puntaje.valor() >= self.precio()
	}
	
	method cobrar() {
		puntaje.gastarPuntos(self.precio())
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
