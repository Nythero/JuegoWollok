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
		fondo.iniciarFondoEnJuego()
		personaje.iniciar()
		velocidad.inicializar()
		puntaje.inicializar()
		nivelManager.iniciarNiveles()
		advancer.iniciarAvance(velocidad.valor())
		self.iniciarColisiones()
		timer.start()
		tienda.start()
	}
	
	method limpiar() {
		buffTracker.clear()
		fondo.limpiar()
		personaje.limpiar()
		velocidad.limpiar()
		puntaje.limpiar()
		advancer.limpiar()
		timer.clear()
		tienda.clear()
		nivelManager.limpiar()
	}
	
	method iniciarColisiones() {
		game.onCollideDo(personaje, {otro => otro.colisionar(personaje)})
	}
}