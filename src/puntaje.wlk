import wollok.game.*
import personaje.*
import spawner.*

object puntaje {
	
	
	
	var puntaje = 0
	
	method puntaje(){
		return puntaje
	}
	
	method sumarPuntos(puntos){
		puntaje += puntos
	}
	
	method ganoJuego() {
		
		return puntaje >= 500
	}
	
	//TODO
	
}
