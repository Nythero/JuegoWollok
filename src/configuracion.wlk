import wollok.game.*


object configuracion {
	
	const property gameHeight = 10
	const property gameWidth = 6
	const property trackHeight = 10
	const property trackWidth = 4
	
	method configuracionInicial(){
		game.title("Objetos Racing")
		game.height(gameHeight)
		game.width(gameWidth)
	}
}
