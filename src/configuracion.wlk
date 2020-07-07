import wollok.game.*

object configuracion {
	
	const property gameHeight = 11
	const property gameWidth = 9
	const property trackHeight = 10
	const property trackWidth = 4
	
	method iniciarConfiguracion(){
		game.title("Objetos Racing")
		game.height(gameHeight)
		game.width(gameWidth)
	}
}
