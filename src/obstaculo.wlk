import wollok.game.*
import spawner.*
import advancer.*
import puntaje.*

object obstaculo {

	var property image = "auto_verde2.png"
	
	var property position
	
	method colisionar(otro){
		game.stop()
	}
}

object obstaculo2 {

	var property image = "auto_verde2.png"
	
	var property position
	
	method colisionar(otro){
		game.stop()
	}
}

object gas {

	var property image = "gas.png"
	
	var property position
	
	method colisionar(otro){
		otro.aumentarVelocidad(10)
		spawner.despawnear(self)
	}
}

object obstaculo3 {

	var property image = "auto_verde2.png"
	
	var property position
	
	method colisionar(otro){
		game.stop()
	}
}

object obstaculo4 {

	var property image = "auto_verde2.png"
	
	var property position
	
	method colisionar(otro){
		game.stop()
	}
}

object obstaculo5 {

	var property image = "auto_verde2.png"
	
	var property position
	
	method colisionar(otro){
		game.stop()
	}
}

object obstaculo6 {

	var property image = "auto_verde2.png"
	
	var property position
	
	method colisionar(otro){
		game.stop()
	}
}

object obstaculo7 {

	var property image = "auto_verde2.png"
	
	var property position
	
	method colisionar(otro){
		game.stop()
	}
}

object moneda {
	
	//Atributos
	
	var property position
	var property image = "moneda2.png"
	
	var property puntosOtorgados = 5
	
	//Metodos
	
	method colisionar(jugador) {
		puntaje.sumarPuntos(puntosOtorgados)
		game.say(jugador, "Puntaje:" + puntaje.puntaje() + "")
		spawner.despawnear(self)
	}
}

object moneda2 {
	
	//Atributos
	
	var property position
	var property image = "moneda2.png"
	
	var property puntosOtorgados = 5
	
	//Metodos
	
	method colisionar(jugador) {
		puntaje.sumarPuntos(puntosOtorgados)
		game.say(jugador, "Puntaje:" + puntaje.puntaje() + "")
		spawner.despawnear(self)
	}
}