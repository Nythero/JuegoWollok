import wollok.game.*
import personaje.*
import logica.timer.*
import magnitudes.*
import buffs.*

class Item inherits TimeableElement {
	
	method image()
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
		if (self.puedeSerComprado() && not self.inTiming()) {
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
		timer.addTimedElement(self)
	}
	
	method activar()
}

object escudo inherits Item {
	
	override method image() = "items/escudo.png"	
	
	override method time() = 3	
	override method precio() = 30
	
	override method activar() {
		personaje.ganarBuff(escudoB)
	}	
}
