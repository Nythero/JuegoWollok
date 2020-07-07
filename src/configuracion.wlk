import cronometrados.tienda.*
import estados.stateManager.*
import personaje.*
import wollok.game.*

object configuracion {
	
	const property gameHeight = 11
	const property gameWidth = 9
	const property trackHeight = 10
	const property trackWidth = 4
	
	method levantarConfiguracion(){
		game.title("Objetos Racing")
		game.height(gameHeight)
		game.width(gameWidth)
		self.levantarTeclas()
		self.levantarColisiones()
	}
	
	method levantarTeclas() {
		personaje.levantarTeclas()
		tienda.setUpKeys()
		stateManager.levantarTeclas()
	}
	
	method levantarColisiones() {
		game.addVisual(personaje)
		game.onCollideDo(personaje, { obstaculo => obstaculo.colisionar(personaje) })
		game.removeVisual(personaje)
	}
}
