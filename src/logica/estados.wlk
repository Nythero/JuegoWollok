import wollok.game.*
import logica.stateManager.*
import personaje.*
import fondo.*
import advancer.*
import magnitudes.*
import tienda.*
import logica.timer.*
import nivel.*
import fondo.*
import logica.buffTracker.*


object enPausa {
	
	method iniciar() {
		game.clear()
		fondo.iniciarFondoEnPausa()
		self.inciarTeclas()
	}
	
	method limpiar() {
		fondo.limpiar()
		self.limpiarTeclas()
	}
	
	method inciarTeclas() {
		keyboard.space().onPressDo({ stateManager.cambiarEstado() })
	}
	
	method limpiarTeclas() {
		keyboard.space().onPressDo({})
	}
}

object enJuego {
	
	method iniciar() {
		game.clear()
		fondo.iniciarFondoEnJuego()
		personaje.iniciar()
		velocidad.inicializar()
		puntaje.inicializar()
		advancer.iniciarAvance(velocidad.valor())
		self.iniciarColisiones()
		timer.start()
		tienda.start()
		nivelManager.iniciarNiveles()
	}
	
	method limpiar() {
		buffTracker.clear()
		fondo.limpiar()
		personaje.limpiar()
		velocidad.limpiar()
		puntaje.limpiar()
		advancer.limpiar()
	}
	
	method iniciarColisiones() {
		game.onCollideDo(personaje, {otro => otro.colisionar(personaje)})
	}
}