import configuracion.*
import obstaculos.advancer.*
import obstaculos.factories.*
import suplementarios.math.*
import wollok.game.*

object spawner {
	const spawnWidth = configuracion.trackWidth()
	const spawnPosition = configuracion.trackHeight()
	
	const factories = [
		factoryObstaculos,
		factoryObstaculosMovedizos,
		factoryMonedas,
		factoryMegaMonedas,
		factoryGases,
		factoryGemas,
		factorySuperEscudos
	]
	
	//Cada factory tira un "dado" y el que tiene el numero mas chico es el elegido
	method elegirFactory(){
		return factories.min({ factory => math.randomByWeight(factory.spawnWeight())})
	}
	
	method spawnearElementoQueAvanza() {
		const elemento = self.elegirFactory().crear()
		elemento.position(self.posicionLibreEnFilaSuperior())
		game.addVisual(elemento)
		advancer.agregarObstaculo(elemento)
	}
	
	method posicionLibreEnFilaSuperior() {
		return game.at(self.carrilAlAzar(),spawnPosition)
	}
	
	method carrilAlAzar() {
		return math.enteroRandomEntre(0, spawnWidth - 1)
	}
	
	method despawnear(elemento) {
		advancer.sacarObstaculo(elemento)
		game.removeVisual(elemento)
	}
}
