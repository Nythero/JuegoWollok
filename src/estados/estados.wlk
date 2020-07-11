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
	
	method siguienteEstado()
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
	
	method cambiar() {
		stateManager.estadoActual(self.siguienteEstado())
	}
	
	method continuar()
	
	method pasarASiguienteFondo() {}
	method imagenDeFondo()
	method usoDeScoreManager()
}

object enPausa inherits Estado {
	
	override method siguienteEstado() = enJuego
	
	override method objetosDeEstado() = [fondo]
	
	override method continuar() {
		stateManager.cambiarEstado()
	}
	
	override method imagenDeFondo() = "fondos/fondoEnPausa.png"
	
	override method pasarASiguienteFondo() {}
	
	override method usoDeScoreManager() = null
}

object enLobby inherits Estado {
	
	override method siguienteEstado() = enJuego
	
	override method objetosDeEstado() = [
		fondo,
		scoreManager
	]
	
	override method continuar() {
		stateManager.cambiarEstado()
	}
	
	override method imagenDeFondo() = "fondos/fondoEnLobby.png"
	
	override method pasarASiguienteFondo() {}
	override method usoDeScoreManager() = displayDeScore
}

object enJuego inherits Estado {
	
	var imagenDeFondoActual = "fondos/fondoEnJuego1.png"
	const imagenesDeFondo = ["fondos/fondoEnJuego1.png", "fondos/fondoEnJuego2.png"]
	
	override method siguienteEstado() = enLobby
	
	override method objetosDeEstado() = [
		fondo,
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
	
	override method continuar() {}
	
	override method imagenDeFondo() {
		return imagenDeFondoActual
	}
	
	override method pasarASiguienteFondo() {
		imagenesDeFondo.add(imagenesDeFondo.get(0))
		imagenesDeFondo.remove(imagenesDeFondo.get(0))
		imagenDeFondoActual = imagenesDeFondo.get(0)
	}
	
	override method usoDeScoreManager() = registroDeScore
}