import wollok.game.*
import spawner.*
import advancer.*

object obstaculo {

	var property image = "auto_verde2.png"
	
	var property position = spawner.posicionLibreEnFilaSuperior()
	
	method avanzar() {
		if (position.y() == 0) {
			advancer.sacarElementoQueAvanza(self)
			game.removeVisual(self)
		}
		else {
			position = game.at(position.x(), position.y() - 1)			
		}
	}
}

object obstaculo2 {

	var property image = "auto_verde2.png"
	
	var property position = spawner.posicionLibreEnFilaSuperior()
	
	method avanzar() {
		if (position.y() == 0) {
			advancer.sacarElementoQueAvanza(self)
			game.removeVisual(self)
		}
		else {
			position = game.at(position.x(), position.y() - 1)			
		}
	}
}

object obstaculo3 {

	var property image = "auto_verde2.png"
	
	var property position = spawner.posicionLibreEnFilaSuperior()
	
	method avanzar() {
		if (position.y() == 0) {
			advancer.sacarElementoQueAvanza(self)
			game.removeVisual(self)
		}
		else {
			position = game.at(position.x(), position.y() - 1)			
		}
	}
}

object obstaculo4 {

	var property image = "auto_verde2.png"
	
	var property position = spawner.posicionLibreEnFilaSuperior()
	
	method avanzar() {
		if (position.y() == 0) {
			advancer.sacarElementoQueAvanza(self)
			game.removeVisual(self)
		}
		else {
			position = game.at(position.x(), position.y() - 1)			
		}
	}
}

object obstaculo5 {

	var property image = "auto_verde2.png"
	
	var property position = spawner.posicionLibreEnFilaSuperior()
	
	method avanzar() {
		if (position.y() == 0) {
			advancer.sacarElementoQueAvanza(self)
			game.removeVisual(self)
		}
		else {
			position = game.at(position.x(), position.y() - 1)			
		}
	}
}