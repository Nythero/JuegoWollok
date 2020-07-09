import estados.estados.*
import wollok.game.*

object stateManager {
	
	var property estadoActual = enPausa
		
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
}
