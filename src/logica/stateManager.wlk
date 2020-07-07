import wollok.game.*
import personaje.*
import obstaculo.*
import spawner.*
import advancer.*
import configuracion.*
import fondo.*
import estados.*
import logica.buffTracker.*

object stateManager {
	
	var property estado = pausado
	const estados = [pausado, enJuego]
		
	method cambiarEstado() {
		buffTracker.clear()
		
		estados.add(estados.get(0))
		estados.remove(estados.get(0))
		estado = estados.get(0)
		
		self.iniciarEstado()
	}
	
	method iniciarEstado() {
		estado.iniciar()
	}
	
	method estaEnJuego() {
		return estado == enJuego
	}
}
