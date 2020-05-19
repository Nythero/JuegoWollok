import wollok.game.*
import configuracion.*
import math.*
import advancer.*
import obstaculo.*
import numbers.*
import lists.*

object spawner {
	const spawnWidth = configuracion.trackWidth()
	const spawnPosition = configuracion.trackHeight()
	
	var aSpawnear = []
	
	method iniciarSpawn(cantO, cantG, cantM){
		self.crearASpawnear(cantO, cantG, cantM)
	}
	
	method aSpawnear(){
		return aSpawnear
	}
	
	method crearASpawnear(cantO, cantG, cantM){
		self.agregarVariosASpawnear({new Obstaculo()}, cantO)
		self.agregarVariosASpawnear({new Moneda()}, cantM)
		self.agregarVariosASpawnear({new Gas()}, cantG)
		self.balancearASpawnear()
	}
	
	method balancearASpawnear(){
		aSpawnear = list.ordenarAlAzar(aSpawnear)
	}
	
	method agregarVariosASpawnear(bloque, cantidad){
		if (cantidad > 0){
			aSpawnear.add(bloque.apply())
			self.agregarVariosASpawnear(bloque, cantidad - 1)
		}
	}
	
  	method elementoASpawnear(){
		return aSpawnear.head()
	}
	
	method spawnearElementoQueAvanza() {
		const elemento = self.elementoASpawnear()
		aSpawnear.remove(elemento)
		elemento.position(self.posicionLibreEnFilaSuperior())
		game.addVisual(elemento)
		advancer.agregarElementoQueAvanza(elemento)
		self.sacarElementoASpawnear(elemento)
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
	
	method sacarElementoASpawnear(elemento) {
		aSpawnear.remove(elemento)
	}
	
	method despawnear(elemento) {
		advancer.sacarElementoQueAvanza(elemento)
		game.removeVisual(elemento)
		aSpawnear.add(elemento)
	}
}
