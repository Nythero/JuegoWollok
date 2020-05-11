import wollok.game.*
import personaje.*

object fondo {
	
	var property image = "fondo_12.png"
	
	var property position = game.at(0,-2)
	
	method avanzar(){
		if (position.y() == -2){
			position = position.up(1)
		}
		else{
			position = position.down(1)
		}
	}
			
}