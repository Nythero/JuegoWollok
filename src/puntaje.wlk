import wollok.game.*
import personaje.*
import spawner.*
import configuracion.*
import math.*
import numbers.*
import writer.*

object puntaje {
	var property puntaje = 0
	
	// Esta constante indica la posicion del dígito de la unidad del puntaje.
	// La posición del resto de los dígitos se calcula en base a ella.
	const puntajePosition = game.at(
		configuracion.trackWidth() - 1,
		configuracion.trackHeight() + 1
	)
	
	var puntajeMostrado
	
	method mostrarPuntaje() {
		puntajeMostrado = new Writing(writing = puntaje, position = puntajePosition)
		puntajeMostrado.displayWriting()
	}
	
	method sumarPuntos(puntos) {
		puntaje += puntos
		puntajeMostrado.refreshWriting(puntaje)
	}
}
