import wollok.game.*
import personaje.*
import obstaculo.*
import spawner.*
import randomizer.*
import advancer.*

object procesamiento {
	//Metodos
	
	method detectarTeclas(){
		keyboard.a().onPressDo({personaje.moverHacia(-1)})
		keyboard.d().onPressDo({personaje.moverHacia(1)})
		keyboard.z().onPressDo({spawner.spawnearElementoQueAvanza(obstaculo)})
		keyboard.x().onPressDo({spawner.spawnearElementoQueAvanza(obstaculo2)})
		keyboard.c().onPressDo({spawner.spawnearElementoQueAvanza(obstaculo3)})
		keyboard.v().onPressDo({spawner.spawnearElementoQueAvanza(obstaculo4)})
		keyboard.b().onPressDo({spawner.spawnearElementoQueAvanza(obstaculo5)})
	}
	
	method detectarAvance() {
		game.onTick(1000, "avanzar", advancer.avanzar())
	}
	
	//Metodos
}
