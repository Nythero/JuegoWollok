import cronometrados.buffTracker.*
import cronometrados.tienda.*
import cronometrados.timer.*
import estados.fondo.*
import estados.stateManager.*
import magnitudes.*
import obstaculos.advancer.*
import obstaculos.nivelManager.*
import personaje.*

class Estado {
	
	method objetosDeEstado()
	
	method iniciar() {
		self.objetosDeEstado().forEach(
			{ objeto => objeto.iniciar() }
		)
	}
	
	method limpiar() {
		self.objetosDeEstado().forEach(
			{ objeto => objeto.limpiar() }
		)
	}
}

object enPausa inherits Estado {
	
	override method objetosDeEstado() = #{fondo}
	
	method continuar() {
		stateManager.cambiarEstado()
	}
}

object enJuego {
	
	method iniciar() {
		fondo.iniciar()
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
	
	method continuar() {}
}