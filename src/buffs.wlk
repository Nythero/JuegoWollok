import wollok.game.*
import logica.detector.*
import logica.timer.*
import personaje.*
import logica.buffTracker.*

class Buff inherits TimeableElement {
	
	override method stopTiming() {
		if (self.inTiming()) {
			timer.removeElement(self)
		}
		game.removeVisual(self)
		super()
		self.deactivate()
	}
	
	method refreshPosition(posicion) {
		self.position(posicion)
	}
	
	method gain() {
		self.startTiming()
		self.activate()
	}
	
	method lose() {		
		self.stopTiming()
	}
	
	method clear() {
		if (self.inTiming()) {
			self.lose()
		}
	}
	
	method deactivate()
}

object buffEscudo inherits Buff {
	override method image() = "items/escudo.png"
	override method time() = 5
	
	method id() = "escudo"
	
	override method activate() {
		personaje.tipoDeAuto(autoConEscudo)
	}
	
	override method deactivate() {
		personaje.tipoDeAuto(autoComun)
	}
}

/*object escudoB inherits Buff{
	
	override method accionar(jugador){
		jugador.perderBuff(self)
	}
	
	override method estadoOpuesto(){
		return noEscudoB
	}
	
	method id(){
		return "escudo"
	}
	
	method duracion(){
		return 3000
	}
}

object noEscudoB inherits Buff{
	
	override method accionar(jugador){
		detector.cambiarEstado()
	}
	
	override method estadoOpuesto(){
		return escudoB
	}
	
	method id(){
		return "escudo"
	}
}*/