import wollok.game.*

object fondo {
	
	var property image = "fondo1.png"
	
	var property position = game.at(0, 0)
	
	method iniciar(){
		game.addVisual(self)
	}
	
	method avanzar(){
		if (image == "fondo1.png"){
			image = "fondo2.png"
		}
		else{
			image = "fondo1.png"
		}
	}
	
	method colisionar(personaje) {
		
	}
			
}