import wollok.game.*
import configuracion.*
import estados.*

object personaje {
	
	//Atributos
	
	var property position = game.at(2,0)
	
	var property tieneEscudo
	
	//Atributos
	
	//Metodos
	
	
	method image() {
		return 
			if (self.tieneEscudo())
				"autoRojoConEscudo.png"
			else
				"auto_rojo2.png"
	}
	
	method iniciar(){
		tieneEscudo = true
		position = game.at(2,0)
		game.addVisual(self)
	}
	
	method moverHacia(x){
		position = game.at((position.x() + x).max(0).min(configuracion.trackWidth() - 1) , position.y())
	}
	
	method ponerEscudo() {
		tieneEscudo = true
	}
	
	method sacarEscudo() {
		tieneEscudo = false
	}
	//Metodos
}
