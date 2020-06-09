import wollok.game.*
import writer.*
import estados.*
import configuracion.*

class Magnitud {	
	var property valor = null
	var valorMostrado = null
	var multiplicador = null
	
	
	method posicionX()
	method posicionY()
	method valorInicial()
	method multiplicadorInicial()	

	method posicion() = game.at(self.posicionX(), self.posicionY()) 
	
	method inicializar() {
		valor = self.valorInicial()
		multiplicador = self.multiplicadorInicial()
		valorMostrado = new Writing(writing = valor, position = self.posicion())
		valorMostrado.displayWriting()
	}
	
	method aumentar(cantidad) {
		valor += cantidad * multiplicador
		valorMostrado.refreshWriting(valor.truncate(0))
	}	
}

object velocidad inherits Magnitud {
	
	override method posicionX() = configuracion.gameWidth() - 1
	override method posicionY() = configuracion.gameHeight() - 4
	override method valorInicial() = 5
	override method multiplicadorInicial() = 0.01
	
	override method aumentar(cantidad) {
		super(cantidad)
		puntaje.aumentarMultiplicador(cantidad/100)
		enJuego.actualizarAvance(valor)
	}	
}

object puntaje inherits Magnitud {
	
	override method posicionX() = configuracion.gameWidth() - 1
	override method posicionY() = configuracion.gameHeight() - 2
	override method valorInicial() = 0
	override method multiplicadorInicial() = 1
	
	method aumentarMultiplicador(cantidad) {
		multiplicador += cantidad
	}
}