import wollok.game.*

object fondo {
	
	var property image = "fondo1.png"
	
	var property position = game.at(0, 0)
	
	const fondos = ["fondo2.png", "fondo1.png"]
	
	method iniciar(){
		game.addVisual(self)
	}
	
	method avanzar(){		
		fondos.add(fondos.get(0))
		fondos.remove(fondos.get(0))
		image = fondos.get(0)
	}
	
	
	
	method colisionar(personaje) {
		
	}
			
}