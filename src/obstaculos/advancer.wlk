import estados.fondo.*
import magnitudes.*
import obstaculos.spawner.*
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
		game.removeTickEvent("avanzar")
		obstaculos.forEach(
			{ obstaculo =>
				spawner.despawnear(obstaculo)
			}
		)
	}
	
	method eliminarEnemigos() {
		self.desfavorables().forEach(
			{ enemigo => spawner.despawnear(enemigo) }
		)
	}
	
	method desfavorables() {
		return
			obstaculos.filter(
				{ elemento => not elemento.esFavorable() }
			)
	}
	
	method procesarAvance(){
		spawner.spawnearElementoQueAvanza()
		self.avanzarObstaculos()
		fondoEnJuego.avanzar()
	}
	
	method iniciar() {
		self.configurarTick(velocidad.valor())
	}
	
	method configurarTick(vel) {
		game.onTick(1000/vel, "avanzar", { self.procesarAvance() })		
	}
	
	method actualizarAvance(vel) {
		game.removeTickEvent("avanzar")
		self.configurarTick(vel)
	}
}
