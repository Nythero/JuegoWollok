import spawner.*
import advancer.*
import fondo.*
import personaje.*
import wollok.game.*

object reloj {

	method procesar(){
		if(spawner.aSpawnear() == []){
			spawner.crearASpawnear(6, 2, 2)
		}
		spawner.spawnearElementoQueAvanza()
		advancer.avanzar()
		fondo.avanzar()
	}
}
