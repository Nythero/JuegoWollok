import wollok.game.*
import logica.spawner.*
import logica.advancer.*
import configuracion.*
import magnitudes.*
import logica.buffTracker.*
import buffs.*

/*
 * Las clases que heredan de Obstaculo REQUIEREN:
 * * override method activar()
 * * override method image()
 * * override method tipo() <- usado por el item borrador para eliminar obstaculos desfavorables
 * 
 * Además, para que el elemento aparezca en el juego, hay que crear su factory
 * 	y agregarla a la lista de factories del spawner.
 */
class Obstaculo {
	var property position
	
	method image()
	method tipo()
	
	method esDesfavorable() {
		return self.tipo() == "desfavorable"
	}
	
	method avanzar() {
		if (self.position().y() == 0) {
			spawner.despawnear(self)
		}
		else {
			self.position(self.position().down(1))
		}
		
	}
	
	method colisionar(otro){
		spawner.despawnear(self)
		self.activar(otro)
	}
	
	
	method activar(otro)
}

class Enemigo inherits Obstaculo {
	
	override method image() = "elementos/enemigoVerde.png"
	override method tipo() = "desfavorable"
	
	override method activar(otro){
		otro.chocar(self)
	}
}

class EnemigoMovedizo inherits Enemigo {
	
	var property direccionMovimiento = [-1, 1].anyOne()
	
	override method image() = "elementos/enemigoAzul.png"
	
	override method avanzar() {
		self.moverLateralmente()
		super()
	}
	
	method moverLateralmente() {
		self.seleccionarDireccion()
		self.position(self.position().right(direccionMovimiento))
	}
	
	method seleccionarDireccion() {
		if (self.position().x() == 0) {
			direccionMovimiento = 1
		}
		else if (self.position().x() == configuracion.trackWidth() - 1) {
			direccionMovimiento = -1
		}
	}
	
}

class Gas inherits Obstaculo {
		
	override method image() = "elementos/gas.png"
	override method tipo() = "favorable"
	
	override method activar(jugador){
		velocidad.aumentar(5)
	}
}

class Moneda inherits Obstaculo {
	
	//Atributos
	override method image() = "elementos/moneda.png"
	override method tipo() = "favorable"
	
	method puntosOtorgados() = 5
	
	//Metodos
	
	override method activar(jugador) {
		puntaje.aumentar(self.puntosOtorgados())
	}
}

class MegaMoneda inherits Moneda {
	
	override method image() = "elementos/megaMoneda.png"
	override method puntosOtorgados() = super() * 5
}


class Gema inherits Obstaculo {
	override method image() = "elementos/gema.png"
	override method tipo() = "favorable"
	
	override method activar(otro) {
		buffTracker.addBuff(buffGema)
	}
}


class SuperEscudo inherits Obstaculo {
	override method image() = "elementos/escudoVerde.png"
	override method tipo() = "favorable"
	
	override method activar(otro) {
		buffTracker.addBuff(buffSuperEscudo)
	}
}