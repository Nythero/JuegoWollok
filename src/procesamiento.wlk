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
		keyboard.z().onPressDo({game.addVisual(obstaculo)})
		keyboard.x().onPressDo({game.addVisual(obstaculo2)})
		keyboard.c().onPressDo({game.addVisual(obstaculo3)})
		keyboard.v().onPressDo({game.addVisual(obstaculo4)})
		keyboard.b().onPressDo({game.addVisual(obstaculo5)})
	}
	
	//Metodos
}
