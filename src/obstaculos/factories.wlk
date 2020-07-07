import obstaculos.obstaculos.*

class Factory {
	var property spawnWeight = null
	
	method crear()
}

object factoryObstaculos inherits Factory {
	
	override method crear(){
		return new Enemigo()
	}
}

object factoryObstaculosMovedizos inherits Factory {
	
	override method crear(){
		return new EnemigoMovedizo()
	}
}

object factoryMonedas inherits Factory {
	
	override method crear(){
		return new Moneda()
	}
}

object factoryMegaMonedas inherits Factory {
	
	override method crear(){
		return new MegaMoneda()
	}
}

object factoryGases inherits Factory {
	
	override method crear(){
		return new Gas()
	}
}

object factoryGemas inherits Factory {
	
	override method crear(){
		return new Gema()
	}
}

object factorySuperEscudos inherits Factory {
	
	override method crear(){
		return new SuperEscudo()
	}
}