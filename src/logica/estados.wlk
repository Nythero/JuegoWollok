import wollok.game.*
import detector.*
import personaje.*
import suplementarios.drawer.*
import reloj.*
import fondo.*
import advancer.*
import magnitudes.*
import tienda.*
import logica.timer.*
import nivel.*

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
		velocidad.inicializar()
		self.iniciarAvance(velocidad.valor())
		puntaje.inicializar()
		self.iniciarColisiones()
		self.detectarTeclas()		
		timer.start()
		tienda.start()
		nivelManager.iniciarNiveles()
	}
	
	method iniciarColisiones() {
		game.onCollideDo(personaje, {otro => otro.colisionar(personaje)})
	}
	
	method iniciarAvance(vel){
		game.onTick(1000/vel, "avanzar", {reloj.procesar()})
	}
	method actualizarAvance(vel){
		game.removeTickEvent("avanzar")
		game.onTick(1000/vel, "avanzar", {reloj.procesar()})
	}
}