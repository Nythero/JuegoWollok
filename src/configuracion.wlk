import wollok.game.*


object configuracion {
	
	const property gameHeight = 11
	const property gameWidth = 9
	const property trackHeight = 9
	const property trackWidth = 4
	
	method configuracionInicial(){
		game.title("Objetos Racing")
		game.height(gameHeight)
		game.width(gameWidth)
	}
}
