import wollok.game.*
import personaje.*
import spawner.*

object puntaje {
	
	
	
	var puntaje = 0
	
	method sumarPuntos(puntos){
		puntaje += puntos
	}
	
	method ganoJuego() {
		
		return puntaje >= 500
	}
	
	//TODO
	
}

object moneda {
	
	//Atributos
	
	var property position = spawner.posicionLibreEnFilaSuperior()
	var property image = "moneda.png"
	
	var property puntos = 5
	
	//Metodos
	
	method aparece() {
		
		game.addVisualIn(self,spawner.posicionLibreEnFilaSuperior())
	}
	
	method fueAtrapadaPorJugador(jugador) {
		
		jugador.sumaPunto(puntos)
		self.desaparece()
	}
	
	method desaparece() {
		
		game.removeVisual(self)
	}
}
