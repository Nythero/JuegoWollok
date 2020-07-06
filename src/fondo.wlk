import wollok.game.*

object fondo {
	
	var property image = "fondos/fondo1.png"
	
	var property position = game.at(0, 0)
	
	const fondos = ["fondos/fondo1.png", "fondos/fondo2.png"]
	
	method ponerFondoEnJuego(){
		image = fondos.get(0)
		game.addVisual(self)
	}
	
	method avanzar(){
		fondos.add(fondos.get(0))
		fondos.remove(fondos.get(0))
		image = fondos.get(0)
	}
	
	method ponerFondoDePausa() {
		game.addVisual(self)
		image = "fondos/fondoPausado.png"
	}
	
	method colisionar(personaje) {
		
	}
			
}