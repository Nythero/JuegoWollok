import wollok.game.*
import personaje.*
import obstaculo.*
import spawner.*
import advancer.*
import configuracion.*
import fondo.*
import suplementarios.numbers.*
import estados.*
import logica.buffTracker.*

object detector {
	
	var property estado = pausado
	const estados = [pausado, enJuego]
	
	
	//Metodos
	
	method detectarConfiguracionInicial() {
		configuracion.configuracionInicial()
	}
	
	method cambiarEstado(){
		buffTracker.clear()
		estados.add(estados.get(0))
		estados.remove(estados.get(0))
		estado = estados.get(0)
		self.iniciarEstado()
	}
	
	method iniciarEstado(){
		estado.iniciar()
	}
	
	method estaEnJuego() {
		return estado == enJuego
	}
	
	//Metodos
}
