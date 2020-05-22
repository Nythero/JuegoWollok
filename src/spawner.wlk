import wollok.game.*
import configuracion.*
import math.*
import advancer.*
import obstaculo.*
import numbers.*
import lists.*
import factories.*

object spawner {
	const spawnWidth = configuracion.trackWidth()
	const spawnPosition = configuracion.trackHeight()
	
	var factories = [factoryObstaculos,factoryMonedas,factoryGases]
	
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
		return math.elementoRandomDeLista(self.posicionesEnFilaSuperior())
	}
	
	method posicionesLibresEnFilaSuperior() {
		return self.posicionesEnFilaSuperior().filter(
			{ posicion => self.esPosicionLibre(posicion) }
		)
	}
	
	method posicionesEnFilaSuperior() {
		return
			math.listaDeEnterosEntre(0, spawnWidth - 1).map(
				{ n => game.at(n, spawnPosition) }
			)
	}
	
	method esPosicionLibre(posicion) {
		return game.getObjectsIn(posicion).size() == 0
	}
	
	method despawnear(elemento) {
		advancer.sacarElementoQueAvanza(elemento)
		game.removeVisual(elemento)
	}
}
