import wollok.game.*
import spawner.*
import advancer.*
import puntaje.*
import detector.*

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

	var property image = "auto_verde2.png"
	
	method colisionar(otro){
		detector.cambiarEstado()
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