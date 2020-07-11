import obstaculos.factories.*
import suplementarios.bucles.*
import wollok.game.*

object nivelManager{
	
	/*const factories = [
		factoryObstaculos, 
		factoryObstaculosMovedizos,
		factoryMonedas,
		factoryMegaMonedas,
		factoryGases,
		factoryGemas,
		factorySuperEscudos,
		factoryEnemigoOro
	]*/
	
	const property niveles = [ //Es una lista de los niveles 
		nivelNormal,     //Nivel Normal
		nivelBonus,     //Nivel Bonus
		nivelSurvive    //Nivel Survive
	]
	
	var nivelActual = niveles.get(0)
	
	method cambiarNivel(){
		nivelActual = self.otroNivel()
		nivelActual.aplicarWeights()
		game.removeTickEvent("cambiar nivel")
		game.onTick(nivelActual.duracion(), "cambiar nivel", { self.cambiarNivel() })
	}
	
	method otroNivel(){
		return niveles.copyWithout(nivelActual).anyOne()
	}
	
	method iniciar(){
		nivelActual.aplicarWeights()
		game.onTick(nivelActual.duracion(), "cambiar nivel", { self.cambiarNivel() })
	}
	
	method limpiar() {
		niveles.forEach({ nivel => nivel.limpiarWeights()})
		game.removeTickEvent("cambiar nivel")
	}
	
	method factoriesActual(){
		return nivelActual.factories()
	}
	
}

class Nivel{
	
	method weights()
	
	method factories()
	
	method weight(i){
		return self.weights().get(i)
	}
	
	method duracion(){
		return 10000
	}
	
	method factory(i){
		return self.factories().get(i)
	}
	
	method aplicarWeights(){
		bucles.for(self.cantidadFactories()-1, { i => self.aplicarWeight(i)})
	}
	
	method cantidadFactories(){
		return self.factories().size()
	}
	
	method aplicarWeight(i){
		self.factory(i).spawnWeight(self.weight(i))
	}
	
	method limpiarWeights(){
		self.factories().forEach({ factory => factory.spawnWeight(null) })
	}
}

object nivelNormal inherits Nivel{
	
	override method duracion(){
		return 10000
	}
	
	override method weights(){
		return [8,1,3,1,1]
	}
	
	override method factories(){
		return [
			factoryObstaculos,
			factoryObstaculosMovedizos,
			factoryMonedas,
			factoryGases,
			factoryEnemigoOro
		]
	}
}

object nivelBonus inherits Nivel{
	
	override method duracion(){
		return 2000
	}
	
	override method weights(){
		return [3,1,0.5]
	}
	
	override method factories(){
		return [
			factoryMonedas,
			factoryMegaMonedas,
			factoryGemas
		]
	}
}

object nivelSurvive inherits Nivel{
	
	override method weights(){
		return [8,3,3,1]
	}
	
	override method factories(){
		return [
			factoryObstaculos,
			factoryObstaculosMovedizos,
			factorySuperEscudos,
			factoryEnemigoOro
		]
	}
	
	
}