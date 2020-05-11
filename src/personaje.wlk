import wollok.game.*
import puntaje.*
import configuracion.*
import detector.*

object personaje {
	
	//Atributos
	
	var property position = game.at(2,0)
	var property image = "auto_rojo2.png"
	var velocidad = 5
	
	//Atributos
	
	//Metodos
	method moverHacia(x){
		position = game.at((position.x() + x).max(0).min(configuracion.trackWidth() - 1) , position.y())
	}
	
	method sumaPunto(puntos) {
		puntaje.sumarPuntos(puntos)
	}
	
	method aumentarVelocidad(cantidad){
		velocidad += cantidad/100
		detector.detectarVelocidad(velocidad)
	}
	
	method velocidad(){
		return velocidad
	}
	
	//Metodos
}