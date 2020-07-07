import cronometrados.buffTracker.*
import cronometrados.tienda.*
import cronometrados.timer.*
import estados.fondo.*
import magnitudes.*
import obstaculos.advancer.*
import obstaculos.nivelManager.*
import personaje.*

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