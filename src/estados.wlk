import wollok.game.*
import detector.*
import personaje.*
import drawer.*
import puntaje.*
import reloj.*
import fondo.*
import advancer.*

object pausado {
	
	var mensaje = new Drawing(	position = game.at(0,0),
								image = "espacio.png"							
	)
	
	method detectarTeclas(){
		keyboard.space().onPressDo({ detector.cambiarEstado() })
	}
	
	method iniciar(){
		game.clear()
		game.addVisual(mensaje)
		self.detectarTeclas()
	}
}

object enJuego {
	
	method detectarTeclas(){
		keyboard.a().onPressDo({ personaje.moverHacia(-1) })
		keyboard.d().onPressDo({ personaje.moverHacia(1) })
	}
	
	method iniciar(){
		game.clear()
		advancer.start()
		fondo.iniciar()
		personaje.iniciar()
		self.iniciarAvance(personaje.velocidad())
		puntaje.mostrarPuntaje()
		self.iniciarColisiones()
		self.detectarTeclas()
	}
	
	method iniciarColisiones() {
		game.onCollideDo(personaje, {otro => otro.colisionar(personaje)})
	}
	
	method iniciarAvance(velocidad){
		game.onTick(1000/velocidad, "avanzar", {reloj.procesar()})
	}
	method actualizarAvance(velocidad){
		game.removeTickEvent("avanzar")
		game.onTick(1000/velocidad, "avanzar", {reloj.procesar()})
	}
}