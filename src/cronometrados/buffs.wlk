import cronometrados.buffTracker.*
import cronometrados.timer.*
import magnitudes.*
import personaje.*

/*
 * Las clases que heredan de Buff REQUIEREN:
 * * override method image()
 * * override method time() <--- tiene que ser menor o igual a 9 para que el display funcione correctamente
 * * override method activate()
 * * override method deactivate()
 * * override method type()
 */
class Buff inherits TimeableElement {
	
	method type()
		
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
		self.endDisplay()
		self.startDisplay(posicion)
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



class BuffEscudo inherits Buff {
	override method type() = "shield"
	
	override method activate() {
		personaje.ponerBuffDeEscudo(self)
	}
	
	override method deactivate() {
		personaje.sacarBuffDeEscudo()
	}
	
	method imagenParaPersonaje()
	
	method recibirChoque() {
		buffTracker.forceRemoveBuff(self)
	}
}

object buffEscudoSimple inherits BuffEscudo {
	
	override method image() = "elementos/escudoAzul.png"
	override method time() = 5
	override method imagenParaPersonaje() = "personaje/personajeConEscudoAzul.png"
}

object buffSuperEscudo inherits BuffEscudo {
	
	override method image() = "elementos/escudoVerde.png"
	override method time() = 9
	override method imagenParaPersonaje() = "personaje/personajeConEscudoVerde.png"
}

object buffMegaEscudo inherits BuffEscudo {
	
	override method image() = "elementos/escudoRosa.png"
	override method time() = 2
	override method imagenParaPersonaje() = "personaje/personajeConEscudoRosa.png"
	
	override method recibirChoque() {}
}



object buffGema inherits Buff {
	
	override method type() = "multiplier"
	
	override method image() = "elementos/gema.png"
	override method time() = 9
	
	override method activate() {
		puntaje.multiplicarMultiplicador(2)
	}
	
	override method deactivate() {
		puntaje.multiplicarMultiplicador(0.5)
	}
}