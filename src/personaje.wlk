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
	
	method moverHacia(x){
		position = game.at((position.x() + x).max(0).min(configuracion.trackWidth() - 1) , position.y())
	}
	
	method chocar(otro){
		tipoDeAuto.chocar()
	}
	
	method limpiar() {
		game.removeVisual(self)
	}
	//Metodos
}

object autoComun {
	const property image = "personaje/personajeSimple.png"
	
	method chocar() {
		stateManager.cambiarEstado()
	}
}

object autoConEscudoSimple {
	const property image = "personaje/personajeConEscudoAzul.png"
	
	method chocar() {
		buffTracker.forceRemoveBuff(buffEscudoSimple)
	}
}

object autoConSuperEscudo {
	const property image = "personaje/personajeConEscudoVerde.png"
	
	method chocar() {
		buffTracker.forceRemoveBuff(buffSuperEscudo)
	}
}

object autoConMegaEscudo {
	const property image = "personaje/personajeConEscudoRosa.png"
	
	method chocar() {}
}