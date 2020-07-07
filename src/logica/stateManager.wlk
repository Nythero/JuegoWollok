import estados.*

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
}
