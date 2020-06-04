import wollok.game.*
import personaje.*
import spawner.*
import configuracion.*
import math.*
import numbers.*
import writer.*

object puntaje {
	var property puntaje
	
	var multiplicador
	
	// Esta constante indica la posicion del dígito de la unidad del puntaje.
	// La posición del resto de los dígitos se calcula en base a ella.
	
	const puntajePosition = game.at(
		configuracion.gameWidth() - 1,
		configuracion.gameHeight() - 2
	)
	
	var property puntajeMostrado
	
	method mostrarPuntaje() {
		puntaje = 0
		multiplicador = 1
		puntajeMostrado = new Writing(writing = puntaje, position = puntajePosition)
		puntajeMostrado.displayWriting()
	}
	
	method sumarPuntos(puntos) {
		puntaje += self.aplicarMultiplicador(puntos)
		puntajeMostrado.refreshWriting(puntaje.truncate(0))
	}
	
	method aplicarMultiplicador(puntos){
		return puntos * multiplicador
	}
	
	method actualizarMultiplicador(_multiplicador){
		multiplicador += _multiplicador
	}
}
