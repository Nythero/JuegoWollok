import wollok.game.*
import configuracion.*
import math.*
import advancer.*
import obstaculo.*
import factories.*

object spawner {
	const spawnWidth = configuracion.trackWidth()
	const spawnPosition = configuracion.trackHeight()
	
	var factories = [factoryObstaculos,factoryMonedas,factoryGases,factoryObstaculosMovedizos]
	
	//Cada factory tira un "dado" y el que tiene el numero mas chico es el elegido
	method elegirFactory(){
		return factories.min({ factory => math.randomByWeight(factory.spawnWeight())})
	}
	
	method spawnearElementoQueAvanza() {
		const elemento = self.elegirFactory().crear()
		elemento.position(self.posicionLibreEnFilaSuperior())
		game.addVisual(elemento)
		advancer.agregarElementoQueAvanza(elemento)
	}
	
	method posicionLibreEnFilaSuperior() {
		return game.at(self.carrilAlAzar(),spawnPosition)
	}
	
	method carrilAlAzar() {
		return math.enteroRandomEntre(0, spawnWidth - 1)
	}
	
	method despawnear(elemento) {
		advancer.sacarElementoQueAvanza(elemento)
		game.removeVisual(elemento)
	}
}
