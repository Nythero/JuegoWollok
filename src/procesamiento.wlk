import wollok.game.*
import personaje.*
import obstaculo.*
import spawner.*
import randomizer.*

object procesamiento {
	//Metodos
	
	method detectarTeclas(){
		keyboard.a().onPressDo({personaje.moverHacia(-1)})
		keyboard.d().onPressDo({personaje.moverHacia(1)})
		keyboard.o().onPressDo({game.addVisual(obstaculo)})
		keyboard.i().onPressDo({game.addVisual(obstaculo2)})
		keyboard.p().onPressDo(
			{ game.say(personaje, spawner.posicionLibreEnFilaSuperior().toString()) }
		)
	}
	
	//Metodos
}
