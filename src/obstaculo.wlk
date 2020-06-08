import wollok.game.*
import spawner.*
import advancer.*
import puntaje.*
import detector.*
import configuracion.*

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
		detector.cambiarEstado()
	}
}

class ObstaculoMovedizo inherits Obstaculo {
	
	var property direccionMovimiento = [-1, 1].anyOne()
	
	override method image() = "auto_azul2.png"
	
	override method avanzar() {
		self.moverLateralmente()
		super()
	}
	
	method moverLateralmente() {
		if (self.position().x() == 0) {
			direccionMovimiento = 1
			self.position(self.position().right(direccionMovimiento))
		}
		else if (self.position().x() == configuracion.trackWidth() - 1) {
			direccionMovimiento = -1
			self.position(self.position().right(direccionMovimiento))
		}
		else {
			self.position(self.position().right(direccionMovimiento))
		}
	}
	
}

class Gas inherits ElementoQueAvanza {

	var property image = "gas.png"
	
	method colisionar(otro){
		otro.aumentarVelocidad(10)
		spawner.despawnear(self)
	}
}

class Moneda inherits ElementoQueAvanza {
	
	//Atributos
	var property image = "moneda2.png"
	
	var property puntosOtorgados = 5
	
	//Metodos
	
	method colisionar(jugador) {
		puntaje.sumarPuntos(puntosOtorgados)
		spawner.despawnear(self)
	}
	method modificarPuntosQueOtorga(puntos) {
		puntosOtorgados = puntos
	}
}