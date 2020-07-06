import obstaculo.*

object factoryObstaculos{
	
	var property spawnWeight
	
	method crear(){
		return new Obstaculo()
	}
}

object factoryObstaculosMovedizos {
	
	var property spawnWeight
	
	method crear(){
		return new ObstaculoMovedizo()
	}
}

object factoryMonedas{
	
	var property spawnWeight
	
	method crear(){
		return new Moneda()
	}
}

object factoryMegaMonedas{
	
	var property spawnWeight
	
	method crear(){
		return new MegaMoneda()
	}
}

object factoryGases{
	
	var property spawnWeight
	
	method crear(){
		return new Gas()
	}
}


object factoryGemas{
	
	var property spawnWeight
	
	method crear(){
		return new Gema()
	}
}


object factorySuperEscudos{
	
	var property spawnWeight
	
	method crear(){
		return new SuperEscudo()
	}
}