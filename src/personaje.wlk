import configuracion.*
import cronometrados.buffs.*
import cronometrados.buffTracker.*
import estados.stateManager.*
import wollok.game.*

object personaje {
	
	//Atributos
	
	var property position = game.at(2,0)
	
	var property tipoDeAuto = autoComun
	
	//Atributos
	
	//Metodos
	
	
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
	
	method chocar(otro) {
		tipoDeAuto.chocar(otro)
	}
	
	method limpiar() {
		game.removeVisual(self)
	}
	//Metodos
}


class Auto {
	method chocar(otro)
}

object autoComun inherits Auto {
	const property image = "personaje/personajeSimple.png"
	
	override method chocar(otro) {
		stateManager.cambiarEstado()
	}
}

class AutoConEscudo inherits Auto {
	override method chocar(otro) {
		otro.activarSideEffect()
	}
}

object autoConMegaEscudo inherits AutoConEscudo {
	const property image = "personaje/personajeConEscudoRosa.png"
}

class AutoConEscudoRemovible inherits AutoConEscudo {
		
	override method chocar(otro) {
		super(otro)
		buffTracker.forceRemoveBuff(self.buffAsociado())
	}
	
	method buffAsociado()
}

object autoConEscudoSimple inherits AutoConEscudoRemovible {	
	const property image = "personaje/personajeConEscudoAzul.png"
	
	override method buffAsociado() = buffEscudoSimple
}

object autoConSuperEscudo inherits AutoConEscudoRemovible {
	const property image = "personaje/personajeConEscudoVerde.png"
	
	override method buffAsociado() = buffSuperEscudo
}