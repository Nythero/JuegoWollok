import wollok.game.*
import personaje.*
import spawner.*
import configuracion.*
import math.*
import numbers.*

object puntaje {
	var property puntaje = 0
	var puntajeMostrado = []
	
	// Esta constante indica la posicion del dígito de la unidad del puntaje.
	// La posición del resto de los dígitos se calcula en base a ella.
	const puntajePosition = game.at(
		configuracion.trackWidth() - 1,
		configuracion.trackHeight() + 1
	)
	
	method puntaje() {
		return puntaje
	}
	
	method sumarPuntos(puntos) {
		puntaje += puntos
		self.refrescarPuntaje()
	}
	
	method refrescarPuntaje() {
		self.removerPuntaje()
		self.mostrarPuntaje()
	}
	
	method removerPuntaje() {
		puntajeMostrado.forEach(
			{ digito => game.removeVisual(digito) }
		)
	}
	
	method mostrarPuntaje() {
		var n = 0
		puntajeMostrado = self.puntajeAMostrar()
		
		puntajeMostrado.reverse().forEach({
			digito =>
				game.addVisualIn(digito, game.at(puntajePosition.x() - n, puntajePosition.y()))
				n++
			}
		)
	}
	
	method puntajeAMostrar() {
		return self.puntajeComoLista().map(
			{ digito => new Num(n = digito) }
		)
	}
	
	method puntajeComoLista() {
		return math.numALista(puntaje)
	}
}
