import wollok.game.*
import personaje.*
import obstaculo.*
import spawner.*
import randomizer.*
import advancer.*
import configuracion.*

object detector {
	//Metodos
	
	method detectarTeclas(){
		keyboard.a().onPressDo({personaje.moverHacia(-1)})
		keyboard.d().onPressDo({personaje.moverHacia(1)})
	}
	
	method detectarAvance() {
		game.onTick(1000, "avanzar", advancer.avanzar())
	}
	
	method detectarColisiones() {
		game.onCollideDo(personaje, {otro => otro.colisionar(personaje)})
	}
	
	method detectarSpawn() {
		spawner.spawnInicial()
	}
	
	method detectarConfiguracionInicial() {
		configuracion.configuracionInicial()
	}
	
	//Metodos
}
