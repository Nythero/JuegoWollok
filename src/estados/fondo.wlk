import estados.estados.*
import estados.stateManager.*
import wollok.game.*

object fondo {
	
	const property position = game.at(0, 0)
	
	method iniciar() {
		game.addVisual(self)
	}
	
	method image() {
		return stateManager.fondoEstadoActual()
	}
	
	method colisionar(personaje) {}
	
	method limpiar() {
		game.removeVisual(self)
	}
	
	method avanzar() {
		stateManager.avanzarFondoDeEstadoActual()
	}
}