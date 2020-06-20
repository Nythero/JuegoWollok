import wollok.game.*
import logica.detector.*
import logica.timer.*
import personaje.*
import logica.buffTracker.*
import magnitudes.*

class Buff inherits TimeableElement {
	
	method gain() {
		self.activate()
		self.startTiming()
	}
	
	override method stopTiming() {
		super()
		buffTracker.forceRemoveBuff(self)
	}
	
	method lose() {
		if (self.inTiming()) {
			timer.forceRemoveElement(self)
			self.deactivate()
		}
		self.endDisplay()
	}
	
	method refreshPosition(posicion) {
		self.position(posicion)
	}
	
	method forceLose() {
		self.deactivate()
		self.endDisplay()
		timer.forceRemoveElement(self)
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
	
	override method activate() {
		personaje.tipoDeAuto(autoConEscudo)
	}
	
	override method deactivate() {
		personaje.tipoDeAuto(autoComun)
	}
}

object buffGema inherits Buff {
	override method image() = "gema.png"
	override method time() = 9
	
	override method activate() {
		puntaje.multiplicarMultiplicador(2)
	}
	
	override method deactivate() {
		puntaje.multiplicarMultiplicador(0.5)
	}
}