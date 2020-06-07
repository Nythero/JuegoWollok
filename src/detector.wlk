import wollok.game.*
import personaje.*
import obstaculo.*
import spawner.*
import advancer.*
import configuracion.*
import fondo.*
import reloj.*
import puntaje.*
import numbers.*
import estados.*

object detector {
	
	var property estado = pausado
	const estados = [pausado, enJuego]
	
	
	//Metodos
	
	method detectarConfiguracionInicial() {
		configuracion.configuracionInicial()
	}
	
	method cambiarEstado(){
		/*if (estado == pausado){
			estado = enJuego
		}
		else {
			estado = pausado
		}*/
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
