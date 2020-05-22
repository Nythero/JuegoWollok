import obstaculo.*

object factoryObstaculos{

	var property spawnWeight = 8
	
	method crear(){
		return new Obstaculo()
	}
}
object factoryMonedas{
	
	var property spawnWeight = 3
	
	method crear(){
		return new Moneda()
	}
}

object factoryGases{
	
	var property spawnWeight = 2
	
	method crear(){
		return new Gas()
	}
}