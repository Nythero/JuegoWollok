import wollok.game.*
import personaje.*
import logica.timer.*
import logica.buffTracker.*
import magnitudes.*
import buffs.*

class Item inherits TimeableElement {
	
	method price()
	
	method startKey(key) {		
		key.onPressDo(
			{ self.buy() }
		)
	}
	
	method buy() {
		if (self.canBeBought() && not self.inCooldown()) {
			self.charge()
			self.beginCooldown()
			self.activate()
		}
	}
	
	method canBeBought() {
		return puntaje.valor() >= self.price()
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
		self.inTiming(false)
	}
}

object escudo inherits Item {
	
	override method image() = "items/escudo.png"	
	
	override method time() = 3
	override method price() = 0
	
	override method activate() {
		buffTracker.addBuff(buffEscudo)
	}
}
