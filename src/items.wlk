import wollok.game.*
import personaje.*
import logica.timer.*
import logica.buffTracker.*
import magnitudes.*
import buffs.*
import logica.advancer.*
import logica.stateManager.*

class Item inherits TimeableElement {
	
	method price()
	
	method startKey(key) {
		key.onPressDo(
			{ self.buy() }
		)
	}
	
	method buy() {
		if (self.canBeBought() and not self.inCooldown()) {
			self.charge()
			self.beginCooldown()
			self.activate()
		}
	}
	
	method canBeBought() {
		return
			stateManager.estaEnJuego() and
			puntaje.valor() >= self.price()
	}
	
	method inCooldown() {
		return self.inTiming()
	}
	
	method charge() {
		puntaje.gastarPuntos(self.price())
	}
	
	method beginCooldown() {
		self.startTiming()
	}
	
	method endCooldown() {
		self.stopTiming()
	}
	
	method deactivate() {
		
	}
}

object escudo inherits Item {
	
	override method image() = "elementos/escudoAzul.png"	
	
	override method time() = 3
	override method price() = 30
	
	override method activate() {
		buffTracker.addBuff(buffEscudoSimple)
	}
}

object megaEscudo inherits Item {
	
	override method image() = "elementos/escudoRosa.png"	
	
	override method time() = 7
	override method price() = 100
	
	override method activate() {
		buffTracker.addBuff(buffMegaEscudo)
	}
}

object borrador inherits Item {
	
	override method image() = "elementos/eraser.png"	
	
	override method time() = 9
	override method price() = 250
	
	override method activate() {
		advancer.eliminarEnemigos()
	}
}
