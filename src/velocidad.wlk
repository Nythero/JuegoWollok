import configuracion.*
import wollok.game.*
import writer.*
import estados.*
import puntaje.*

object velocidad {
	var property valor
	var property velocidadMostrada	
	const velocidadPosition = game.at(
		configuracion.gameWidth() - 1,
		configuracion.gameHeight() - 4
	)
	
	method inicializar() {
		valor = 5
		velocidadMostrada = new Writing(writing = valor, position = velocidadPosition)
		velocidadMostrada.displayWriting()
	}
	
	method aumentarVelocidad(cantidad){
		valor += cantidad/100
		puntaje.actualizarMultiplicador(cantidad/100)
		enJuego.actualizarAvance(valor)
		velocidadMostrada.refreshWriting(valor.truncate(0))
	}	
}
