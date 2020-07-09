import magnitudes.*
import suplementarios.writer.*

object scoreManager {
	var property estadoDeScoreManager = scoreManagerEnJuego
	const property scores = []
	
	method iniciar() {
		estadoDeScoreManager.iniciar()
	}
	
	method limpiar() {
		estadoDeScoreManager.limpiar()
	}
}

object scoreManagerEnJuego {
	
	method iniciar() {}
	
	method limpiar() {
		scoreManager.scores().add(puntaje.valor())
	}
}

object scoreManagerEnLobby {
	
	method iniciar() {
		
	}
	
	method limpiar() {
		
	}
}