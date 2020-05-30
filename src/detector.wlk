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
	
	var estado = pausado
	
	
	//Metodos
	
	method detectarConfiguracionInicial() {
		configuracion.configuracionInicial()
	}
	
	method cambiarEstado(){
		if (estado == pausado){
			estado = enJuego
		}
		else {
			estado = pausado
		}
		self.iniciarEstado()
	}
	
	method iniciarEstado(){
		estado.iniciar()
	}
	
	//Metodos
}
