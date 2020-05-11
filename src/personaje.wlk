import wollok.game.*
import puntaje.*
import advancer.*
import spawner.*
import configuracion.*

object personaje {
	
	//Atributos
	
	var property position = game.at(2,0)
	var property image = "auto_rojo2.png"
	var velocidad = 1
	
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
		game.removeTickEvent("avanzar")
		game.onTick(1000/velocidad, "avanzar",advancer.avanzar())
		game.removeTickEvent("spawnear")
		game.onTick(1000/velocidad, "spawnear", {spawner.spawnearElementoQueAvanza(spawner.aSpawnear().anyOne())})
	}
	
	method avanzar(){
		game.onTick(1000, "avanzar", advancer.avanzar())
	}
	
	//Metodos
}