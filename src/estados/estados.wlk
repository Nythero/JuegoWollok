import cronometrados.buffTracker.*
import cronometrados.tienda.*
import cronometrados.timer.*
import estados.fondo.*
import estados.stateManager.*
import magnitudes.*
import obstaculos.advancer.*
import obstaculos.nivelManager.*
import personaje.*
import scoreManager.*

class Estado {
	
	method objetosDeEstado() = [fondo]
	method siguienteEstado()
	
	method continuar()
	
	method imagenDeFondo()
	
	method usoDeScoreManager()
	
	method pasarASiguienteFondo()
	
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
	
	
	method cambiar() {
		stateManager.estadoActual(self.siguienteEstado())
	}
}

object enJuego inherits Estado {
	
	var imagenDeFondoActual = "fondos/fondoEnJuego1.png"
	const imagenesDeFondo = ["fondos/fondoEnJuego1.png", "fondos/fondoEnJuego2.png"]
	
	override method siguienteEstado() = enLobby
	override method usoDeScoreManager() = registroDeScore
	override method continuar() {}
	
	override method objetosDeEstado() {
		return super() + [
			personaje,
			velocidad,
			puntaje,
			nivelManager,
			advancer,
			timer,
			tienda,
			scoreManager,
			buffTracker
		]
	}
	
	override method imagenDeFondo() {
		return imagenDeFondoActual
	}
	
	override method pasarASiguienteFondo() {
		imagenesDeFondo.add(imagenesDeFondo.get(0))
		imagenesDeFondo.remove(imagenesDeFondo.get(0))
		imagenDeFondoActual = imagenesDeFondo.get(0)
	}
	
}


class EstadoPausado inherits Estado {
	
	override method siguienteEstado() = enJuego
	override method continuar() { stateManager.cambiarEstado() }
	override method pasarASiguienteFondo() {}
}

object enInicio inherits EstadoPausado {
	
	override method imagenDeFondo() = "fondos/fondoEnPausa.png"
	override method usoDeScoreManager() = null
}

object enLobby inherits EstadoPausado {
	
	override method objetosDeEstado() = super() + [scoreManager]
	override method imagenDeFondo() = "fondos/fondoEnLobby.png"
	override method usoDeScoreManager() = displayDeScore
}