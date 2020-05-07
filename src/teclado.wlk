import wollok.game.*
import personaje.*

object teclado {
	//Metodos
	
	method detectarTeclas(){
		keyboard.a().onPressDo({personaje.moverHacia(-1)})
		keyboard.d().onPressDo({personaje.moverHacia(1)})
	}
	
	//Metodos
}
