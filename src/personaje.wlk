import configuracion.*
import cronometrados.buffs.*
import cronometrados.buffTracker.*
import estados.stateManager.*
import wollok.game.*

object personaje {
	
	var property position = game.at(2,0)
	
	var property tipoDeAuto = autoSinEscudo
	
	
	method image() {
		return tipoDeAuto.image()
	}
	
	method iniciar() {
		position = game.at(2,0)
		game.addVisual(self)
	}
	
	method levantarTeclas() {
		keyboard.a().onPressDo({ self.moverHacia(-1) })
		keyboard.d().onPressDo({ self.moverHacia(1) })
	}
	
	method moverHacia(x) {
		position = game.at((position.x() + x).max(0).min(configuracion.trackWidth() - 1) , position.y())
	}
	
	method chocar(enemigo) {
		tipoDeAuto.chocar(enemigo)
	}
	
	method limpiar() {
		game.removeVisual(self)
	}
	
	method ponerBuffDeEscudo(buff) {
		tipoDeAuto = autoConEscudo
		autoConEscudo.buffDeEscudo(buff)
	}
	
	method sacarBuffDeEscudo() {
		autoConEscudo.buffDeEscudo(null)
		tipoDeAuto = autoSinEscudo
	}
}


object autoSinEscudo {
	const property image = "personaje/personajeSimple.png"
	
	method chocar(enemigo) {
		stateManager.cambiarEstado()
	}
}

object autoConEscudo {
	
	var property buffDeEscudo = null
	
	method image() {
		return buffDeEscudo.imagenParaPersonaje()
	}
	
	method chocar(enemigo) {
		enemigo.activarSideEffect()
		buffDeEscudo.recibirChoque()
	}
}