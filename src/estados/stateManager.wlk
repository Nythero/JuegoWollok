import estados.estados.*
import wollok.game.*

object stateManager {
	
	var property estadoActual = enPausa
	const estados = [enPausa, enJuego]
		
	method cambiarEstado() {
		estadoActual.limpiar()
		
		estados.add(estados.get(0))
		estados.remove(estados.get(0))
		estadoActual = estados.get(0)
		
		self.iniciarEstado()
	}
	
	method iniciarEstado() {
		estadoActual.iniciar()
	}
	
	method estaEnJuego() {
		return estadoActual == enJuego
	}
	
	method levantarTeclas() {
		keyboard.space().onPressDo({ self.ponerEnJuego() })
	}
	
	method ponerEnJuego() {
		if (not self.estaEnJuego()) {
			self.cambiarEstado()
		}
	}
}
