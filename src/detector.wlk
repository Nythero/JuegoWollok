import wollok.game.*
import personaje.*
import obstaculo.*
import spawner.*
import randomizer.*
import advancer.*

object detector {
	//Metodos
	
	method detectarTeclas(){
		keyboard.a().onPressDo({personaje.moverHacia(-1)})
		keyboard.d().onPressDo({personaje.moverHacia(1)})
		keyboard.z().onPressDo({spawner.spawnearElementoQueAvanza(obstaculo)})
		keyboard.x().onPressDo({spawner.spawnearElementoQueAvanza(gas)})
		keyboard.c().onPressDo({spawner.spawnearElementoQueAvanza(obstaculo3)})
		keyboard.v().onPressDo({spawner.spawnearElementoQueAvanza(obstaculo4)})
		keyboard.b().onPressDo({spawner.spawnearElementoQueAvanza(obstaculo5)})
		keyboard.m().onPressDo({spawner.spawnearElementoQueAvanza(moneda)})
	}
	
	method detectarAvance() {
		game.onTick(1000, "avanzar", advancer.avanzar())
	}
	
	method detectarColiciones() {
		game.onCollideDo(personaje, {otro => otro.colisionar(personaje)})
	}
	
	//Metodos
}
