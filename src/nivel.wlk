import logica.factories.*
import suplementarios.list.*
import wollok.game.*

object nivelManager{
	const factories = [
		factoryObstaculos, 
		factoryObstaculosMovedizos,
		factoryMonedas,
		factoryMegaMonedas,
		factoryGases,
		factoryGemas,
		factorySuperEscudos
	]
	
	const property niveles = [ //Es una lista de los pesos de los factories correspondientes por posicion
		//new Nivel(weights = [8,1,3,0.5,2,1,0.5,0]), 
		new Nivel(weights = [8,1,3,0,1,0,0]),     //Nivel Normal
		new Nivel(weights = [0,0,3,1,0,0.5,0]),   //Nivel Bonus
		new Nivel(weights = [8,3,0,0,0,0,3])      //Nivel Survive
	]
	
	var nivelActual = niveles.get(0)
	
	method aplicarWeights(nivel){
		lista.naturalesHasta(factories.size()-1).forEach({ i =>
			self.aplicarWeight(nivel, i)
		})
	}
	
	method aplicarWeight(nivel, i){
		factories.get(i).spawnWeight(nivel.weight(i))
	}
	
	method cambiarNivel(){
		const nivelNuevo = niveles.copyWithout(nivelActual).anyOne()
		self.aplicarWeights(nivelNuevo)
		nivelActual = nivelNuevo
	}
	
	method iniciarNiveles(){
		self.aplicarWeights(niveles.get(0))
		game.onTick(10000, "cambiar nivel", { self.cambiarNivel() })
	}
	
	method limpiar() {
		factories.forEach(
			{ factory => factory.spawnWeight(null) }
		)
		game.removeTickEvent("cambiar nivel")
	}
}

class Nivel{
	
	const weights
	
	method weight(i){
		return weights.get(i)
	}
}