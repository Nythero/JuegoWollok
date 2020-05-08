import wollok.game.*
import randomizer.*

object spawner {
	
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
}
