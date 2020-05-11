import spawner.*
import advancer.*
import fondo.*
import personaje.*
import wollok.game.*

object reloj {

	method procesar(){
		spawner.spawnearElementoQueAvanza(spawner.elementoASpawnear())
		advancer.avanzar()
		fondo.avanzar()
	}
}
