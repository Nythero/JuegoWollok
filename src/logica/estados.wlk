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
import configuracion.*


object enPausa {
	
	method iniciar() {
		fondo.iniciarFondoEnPausa()
	}
	
	method limpiar() {
		fondo.limpiar()
	}
}

object enJuego {
	
	method iniciar() {
		fondo.iniciarFondoEnJuego()
		personaje.iniciar()
		velocidad.iniciar()
		puntaje.iniciar()
		nivelManager.iniciarNiveles()
		advancer.iniciarAvance(velocidad.valor())
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
}