import wollok.game.*
import logica.stateManager.*
import personaje.*
import fondo.*
import advancer.*
import magnitudes.*
import tienda.*
import logica.timer.*
import nivel.*
import fondo.*


object pausado {
	
	method detectarTeclas(){
		keyboard.space().onPressDo({ stateManager.cambiarEstado() })
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
		advancer.iniciarAvance(velocidad.valor())
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
}