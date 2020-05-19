import wollok.game.*
import spawner.*
import advancer.*
import puntaje.*

class Obstaculo {

	var property image = "auto_verde2.png"
	
	var property position
	
	method colisionar(otro){
		game.stop()
	}
}

class Gas {

	var property image = "gas.png"
	
	var property position
	
	method colisionar(otro){
		otro.aumentarVelocidad(10)
		spawner.despawnear(self)
	}
}

class Moneda {
	
	//Atributos
	
	var property position
	var property image = "moneda2.png"
	
	var property puntosOtorgados = 5
	
	//Metodos
	
	method colisionar(jugador) {
		puntaje.sumarPuntos(puntosOtorgados)
		spawner.despawnear(self)
	}
	
}