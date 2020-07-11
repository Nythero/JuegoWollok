import estados.estados.*
import wollok.game.*

object stateManager {
	
	var property estadoActual = enInicio
		
	method cambiarEstado() {
		estadoActual.limpiar()
		estadoActual.cambiar()
		self.iniciarEstado()
	}
	
	method iniciarEstado() {
		estadoActual.iniciar()
	}
	
	method estaEnJuego() {
		return estadoActual == enJuego
	}
	
	method levantarTeclas() {
		keyboard.space().onPressDo({ estadoActual.continuar() })
	}
	
	method fondoEstadoActual() {
		return estadoActual.imagenDeFondo()
	}
	
	method avanzarFondoDeEstadoActual() {
		estadoActual.pasarASiguienteFondo()
	}
	
	method usoScoreManagerEstadoActual() {
		return estadoActual.usoDeScoreManager()
	}
}
