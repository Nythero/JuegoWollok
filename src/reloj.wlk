import spawner.*
import advancer.*
import fondo.*
import personaje.*
import wollok.game.*

object reloj {
	
	method iniciarReloj(){
		game.addVisual(fondo)
		advancer.agregarElementoQueAvanza(fondo)
		game.onTick(1000/personaje.velocidad(), "spawnear", {spawner.spawnearElementoQueAvanza(spawner.aSpawnear().anyOne())})
		game.onTick(1000/personaje.velocidad(), "avanzar", advancer.avanzar())
		
	}
	
	method actualizarReloj(velocidad){
		game.removeTickEvent("avanzar")
		game.onTick(1000/velocidad, "avanzar",advancer.avanzar())
		game.removeTickEvent("spawnear")
		game.onTick(1000/velocidad, "spawnear", {spawner.spawnearElementoQueAvanza(spawner.aSpawnear().anyOne())})
	}
}
