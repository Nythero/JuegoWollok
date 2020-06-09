import wollok.game.*
import spawner.*
import advancer.*
import detector.*
import configuracion.*
import magnitudes.*

class ElementoQueAvanza {
	var property position
	
	method avanzar() {
		if (self.position().y() == 0) {
			spawner.despawnear(self)
		}
		else {
			self.position(self.position().down(1))
		}
	}
}

class Obstaculo inherits ElementoQueAvanza {

	method image() = "auto_verde2.png"
	
	method colisionar(otro){
		if (otro.tieneEscudo()) {
			spawner.despawnear(self)
			otro.sacarEscudo()
		}
		else {
			detector.cambiarEstado()			
		}
	}
}

class ObstaculoMovedizo inherits Obstaculo {
	
	var property direccionMovimiento = [-1, 1].anyOne()
	const property direccionesMovimiento
	
	override method image() = "auto_azul2.png"
	
	override method avanzar() {
		self.moverLateralmente()
		super()
	}
	
	method moverLateralmente() {
		self.seleccionarDireccion()
		self.position(self.position().right(direccionMovimiento))
	}
	
	method seleccionarDireccion() {
		if (self.position().x() == 0) {
			direccionMovimiento = 1
		}
		else if (self.position().x() == configuracion.trackWidth() - 1) {
			direccionMovimiento = -1
		}
	}
	
}

class Gas inherits ElementoQueAvanza {

	var property image = "gas.png"
	
	method colisionar(otro){
		velocidad.aumentar(10)
		spawner.despawnear(self)
	}
}

class Moneda inherits ElementoQueAvanza {
	
	//Atributos
	var property image = "moneda2.png"
	
	method puntosOtorgados() = 5
	
	//Metodos
	
	method colisionar(jugador) {
		puntaje.aumentar(self.puntosOtorgados())
		spawner.despawnear(self)
	}
}

class MegaMoneda inherits Moneda {
	
	override method image() = "megaMoneda.png"
	override method puntosOtorgados() = 25
}