import wollok.game.*
import configuracion.*
import estados.*

object personaje {
	
	//Atributos
	
	var property position = game.at(2,0)
	const property image = "auto_rojo2.png"
	
	//Atributos
	
	//Metodos
	
	method iniciar(){
		position = game.at(2,0)
		game.addVisual(self)
	}
	
	method moverHacia(x){
		position = game.at((position.x() + x).max(0).min(configuracion.trackWidth() - 1) , position.y())
	}
	//Metodos
}
