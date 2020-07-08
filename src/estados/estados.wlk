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
		self.objetosDeEstado().reverse().forEach(
			{ objeto => objeto.limpiar() }
		)
	}
	
	method continuar()
}

object enPausa inherits Estado {
	
	override method objetosDeEstado() = [fondo]
	
	override method continuar() {
		stateManager.cambiarEstado()
	}
}

object enJuego inherits Estado {
	
	override method objetosDeEstado() = [
		fondo,
		personaje,
		velocidad,
		puntaje,
		nivelManager,
		advancer,
		timer,
		tienda,
		buffTracker
	]
	
	override method continuar() {}
}