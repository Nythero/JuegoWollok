import wollok.game.*

class Item {
	
	var property onCooldown = false
	
	method image()
	
	method cooldown()
	method precio()
	method activar()
	
	method inicializarEn(posicion) {
		game.addVisualIn(self, posicion)
	}
}

class Escudo inherits Item {
	
	
}
