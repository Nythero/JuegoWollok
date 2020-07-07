import spawner.*
import fondo.*
import wollok.game.*

object advancer {
	const property obstaculos = []
	
	method agregarObstaculo(elemento) {
		obstaculos.add(elemento)
	}
	
	method sacarObstaculo(elemento) {
		obstaculos.remove(elemento)
	}
	
	method avanzarObstaculos() {
		obstaculos.forEach(
		  { elemento => elemento.avanzar() }
		)
	}
	
	method limpiar(){
		obstaculos.forEach(
			{ obstaculo =>
				spawner.despawnear(obstaculo)
			}
		)
	}
	
	method eliminarEnemigos() {
		self.enemigos().forEach(
			{ enemigo => spawner.despawnear(enemigo) }
		)
	}
	
	method enemigos() {
		return
			obstaculos.filter(
				{ elemento => elemento.esDesfavorable() }
			)
	}
	
	method procesarAvance(){
		spawner.spawnearElementoQueAvanza()
		self.avanzarObstaculos()
		fondo.avanzar()
	}
	
	method iniciarAvance(vel) {
		game.onTick(1000/vel, "avanzar", { self.procesarAvance() })
	}
	
	method actualizarAvance(vel) {
		game.removeTickEvent("avanzar")
		self.iniciarAvance(vel)
	}
}
