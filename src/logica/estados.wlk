import wollok.game.*
import detector.*
import personaje.*
import reloj.*
import fondo.*
import advancer.*
import magnitudes.*
import tienda.*
import logica.timer.*
import nivel.*
import fondo.*

object pausado {
	
	method detectarTeclas(){
		keyboard.space().onPressDo({ detector.cambiarEstado() })
	}
	
	method iniciar(){
		game.clear()
		fondo.ponerFondoDePausa()
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
		fondo.ponerFondoEnJuego()
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