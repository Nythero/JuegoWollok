import wollok.game.*

object personaje {
	
	//Atributos
	
	var property position = game.at(2,0)
	var property image = "auto_rojo.png"
	
	//Atributos
	
	//Metodos
	method moverHacia(x){
		position = game.at((position.x() + x).max(0).min(game.width()-1) , position.y())
	}
	method chocar(){
	}
	
	//Metodos
}