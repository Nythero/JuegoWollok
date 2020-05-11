import wollok.game.*
import personaje.*
import obstaculo.*
import spawner.*
import randomizer.*
import advancer.*
import configuracion.*
import fondo.*
import reloj.*

object detector {
	//Metodos
	
	method detectarTeclas(){
		keyboard.a().onPressDo({personaje.moverHacia(-1)})
		keyboard.d().onPressDo({personaje.moverHacia(1)})
		keyboard.space().onPressDo({game.start()})
	}
	
	method detectarAvance(){
		game.onTick(1000/personaje.velocidad(), "avanzar", {reloj.procesar()})
	}
	
	method detectarColisiones() {
		game.onCollideDo(personaje, {otro => otro.colisionar(personaje)})
	}
	
	method detectarVisuales(){
		game.addVisual(fondo)
		game.addVisual(personaje)
	}
	
	method detectarConfiguracionInicial() {
		configuracion.configuracionInicial()
	}
	
	method detectarVelocidad(velocidad){
		game.removeTickEvent("avanzar")
		game.onTick(1000/velocidad, "avanzar", {reloj.procesar()})
	}
	
	//Metodos
}
