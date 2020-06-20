import wollok.game.*
import logica.writer.*
import logica.estados.*
import configuracion.*

class Magnitud {	
	var property valor	= null
	var valorMostrado 	= null
	var property multiplicador 	= null
	var multDisplay 	= null 
	
	
	method posicionX()
	method posicionY()
	method valorInicial()
	method multiplicadorInicial()
	method multDisplay()
	
	method valorMostrado(){
		return valor * self.multDisplay()
	}

	method posicion() = game.at(self.posicionX(), self.posicionY()) 
	
	method inicializar() {
		valor = self.valorInicial()
		multiplicador = self.multiplicadorInicial()
		valorMostrado = new Writing(writing = self.valorMostrado(), position = self.posicion())
		valorMostrado.displayWriting()
	}
	
	method aumentar(cantidad) {
		valor += cantidad * multiplicador
		valorMostrado.refreshWriting((valor * self.multDisplay()).truncate(0))
	}	
}

object velocidad inherits Magnitud {
	
	override method posicionX() = configuracion.gameWidth() - 1
	override method posicionY() = configuracion.gameHeight() - 5
	override method valorInicial() = 5
	override method multiplicadorInicial() = 0.01
	override method multDisplay() = 10
	
	override method aumentar(cantidad) {
		super(cantidad)
		puntaje.sumarMultiplicador(cantidad/100)
		enJuego.actualizarAvance(valor)
	}	
}

object puntaje inherits Magnitud {
	
	override method posicionX() = configuracion.gameWidth() - 1
	override method posicionY() = configuracion.gameHeight() - 2
	override method valorInicial() = 0
	override method multiplicadorInicial() = 1
	override method multDisplay() = 1
	
	
	method sumarMultiplicador(cantidad) {
		multiplicador += cantidad
	}
	
	method multiplicarMultiplicador(cantidad) {
		multiplicador *= cantidad
	}
	
	method gastarPuntos(cantidad) {
		valor -= cantidad
		valorMostrado.refreshWriting(valor.truncate(0))
	}
}