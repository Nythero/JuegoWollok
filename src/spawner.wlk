import wollok.game.*
import configuracion.*
import math.*
import advancer.*
import obstaculo.*
import numbers.*

object spawner {
	const spawnWidth = configuracion.trackWidth()
	const spawnPosition = configuracion.trackHeight()
	
	var aSpawnear = [obstaculo, obstaculo2, obstaculo3, obstaculo4, obstaculo5, obstaculo6, obstaculo7, moneda, moneda2, gas]
	
  	method elementoASpawnear(){
		return aSpawnear.anyOne()
	}
	
	method spawnearElementoQueAvanza(elemento) {
		elemento.position(self.posicionLibreEnFilaSuperior())
		game.addVisual(elemento)
		advancer.agregarElementoQueAvanza(elemento)
		self.sacarElementoASpawnear(elemento)
	}
	
	method posicionLibreEnFilaSuperior() {
		return math.elementoRandomDeLista(self.posicionesLibresEnFilaSuperior())
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
	
	method sacarElementoASpawnear(elemento) {
		aSpawnear.remove(elemento)
	}
	
	method despawnear(elemento) {
		advancer.sacarElementoQueAvanza(elemento)
		game.removeVisual(elemento)
		aSpawnear.add(elemento)		
	}
}
