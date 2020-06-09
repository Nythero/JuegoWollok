import wollok.game.*
import personaje.*

class Item {
	
	var property enCooldown = false
	
	method image()
	
	method cooldown()
	method precio()
	
	method inicializarPosicion(posicionDada) {		
		game.addVisualIn(self, posicionDada)
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
		self.enCooldown(true)
	}
	
	method activar()
}

object escudo inherits Item {
	
	override method image() = "items/escudo.png"	
	
	override method cooldown() = 5	
	override method precio() = 30
	
	override method activar() {
		personaje.ponerEscudo()
	}	
}
