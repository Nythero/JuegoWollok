import wollok.game.*

object fondo {
	
	var property image
	var property position = game.at(0, 0)
	var property estadoDeFondo = fondoEnPausa
	
	method iniciar() {
		estadoDeFondo.iniciar()
	}
	
	method colisionar(personaje) {}
	
	method limpiar() {
		game.removeVisual(self)
		estadoDeFondo.cambiarEstado()
	}
}

object fondoEnPausa {
	method iniciar() {
		fondo.image("fondos/fondoEnPausa.png")
		game.addVisual(fondo)
	}
	
	method cambiarEstado() {
		fondo.estadoDeFondo(fondoEnJuego)
	}
}

object fondoEnJuego {
	const fondos = ["fondos/fondoEnJuego1.png", "fondos/fondoEnJuego2.png"]
	
	method iniciar() {
		fondo.image(fondos.get(0))
		game.addVisual(fondo)
	}
	
	method cambiarEstado() {
		fondo.estadoDeFondo(fondoEnPausa)
	}
	
	method avanzar() {
		fondos.add(fondos.get(0))
		fondos.remove(fondos.get(0))
		fondo.image(fondos.get(0))
	}
}