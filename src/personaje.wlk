import wollok.game.*

object personaje {
	
	//Atributos
	var property position = game.at(2,0)
	var property image = "auto_rojo.png"
	//Atributos
	
	//Setters
	
	
	//Setters
	//Getters
	
	
	
	//Getters
	
	//Metodos
	method moverHacia(x){
		position = game.at(position.x() + x , position.y())
	}
	//Metodos
}