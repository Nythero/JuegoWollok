import wollok.game.*

object fondo {
	
	var property image
	var property position = game.at(0, 0)
	
	const fondosEnJuego = ["fondos/fondoEnJuego1.png", "fondos/fondoEnJuego2.png"]	
	const fondoEnPausa = "fondos/fondoEnPausa.png"
	
	method iniciarFondoEnJuego(){
		image = fondosEnJuego.get(0)
		game.addVisual(self)
	}
	
	method avanzar(){
		fondosEnJuego.add(fondosEnJuego.get(0))
		fondosEnJuego.remove(fondosEnJuego.get(0))
		image = fondosEnJuego.get(0)
	}
	
	method iniciarFondoEnPausa() {
		image = fondoEnPausa
		game.addVisual(self)
	}
	
	method colisionar(personaje) {}
	
	method limpiar() {
		game.removeVisual(self)
	}
}