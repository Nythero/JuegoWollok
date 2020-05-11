import wollok.game.*
import personaje.*
import randomizer.*
import advancer.*
import obstaculo.*

object spawner {
	
	var property aSpawnear = [obstaculo, obstaculo2, obstaculo3, obstaculo4, obstaculo5, obstaculo6, obstaculo7, moneda, moneda2, gas]
	
	method spawn(){
		game.addVisual(personaje)
		game.onTick(1000, "spawnear", {self.spawnearElementoQueAvanza(aSpawnear.anyOne())})
	}
	
	method spawnearElementoQueAvanza(elemento) {
		elemento.position(self.posicionLibreEnFilaSuperior())
		game.addVisual(elemento)
		advancer.agregarElementoQueAvanza(elemento)
		self.sacarElementoASpawnear(elemento)
	}
	
	method posicionLibreEnFilaSuperior() {
		return randomizer.elementoRandomDeLista(self.posicionesLibresEnFilaSuperior())
	}
	
	method posicionesLibresEnFilaSuperior() {
		return self.posicionesEnFilaSuperior().filter(
			{ posicion => self.esPosicionLibre(posicion) }
		)
	}
	
	method posicionesEnFilaSuperior() {
		return
			randomizer.listaDeEnterosEntre(0, game.width() - 1).map(
				{ n => game.at(n, game.height() - 1) }
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
		self.aSpawnear().add(elemento)		
	}
}
