import estados.stateManager.*
import magnitudes.*
import suplementarios.writer.*
import wollok.game.*

object scoreManager {
	var property usoDeScoreManager
	const property scores = []
	
	method iniciar() {
		usoDeScoreManager = stateManager.usoScoreManagerEstadoActual()
		usoDeScoreManager.iniciar()
	}
	
	method limpiar() {
		usoDeScoreManager.limpiar()
	}
	
	method registrarScore(valor) {
		scores.add(valor)
		if (scores.size() > 5) {
			scores.remove(scores.min())
		}
	}
	
	method sortedScores() {
		return
			scores.sortedBy(
				{ s1, s2 => s1 > s2 }
			)
	}
}

object registroDeScore {
	
	method iniciar() {}
	
	method limpiar() {
		scoreManager.registrarScore(puntaje.valor())
		scoreManager.usoDeScoreManager(self)
	}
}

object displayDeScore {
	const property height = game.height() - 4
	const scoresEnDisplay = []
	
	method iniciar() {
		var n = 0;
		scoreManager.sortedScores().forEach(
			{ score =>
				self.displayScoreAt(score, n)
				n++
			}
		)
	}
	
	method displayScoreAt(score, n) {
		const scoreDisp = new ScoreDisplay(valor = score, slot = n)
		scoreDisp.iniciarDisplay()
		
		scoresEnDisplay.add(scoreDisp)
	}
	
	method limpiar() {
		scoresEnDisplay.forEach(
			{ scoreDisp =>
				scoreDisp.limpiarDisplay()
				scoresEnDisplay.remove(scoreDisp)
			}
		)
		scoreManager.usoDeScoreManager(self)
	}
}

class ScoreDisplay {
	const property valor
	const property slot
	var displayRank = null
	var displayValor = null
	
	method iniciarDisplay() {
		self.iniciarDisplayRank()
		self.iniciarDisplayScore()
	}
	
	method iniciarDisplayRank() {
		displayRank = new Writing(
			writing = slot + 1,
			position = game.at(0, displayDeScore.height() - slot)
		)
		displayRank.displayWriting()
	}
	
	method iniciarDisplayScore() {
		displayValor = new Writing(
			writing = valor,
			position = game.at(5, displayDeScore.height() - slot)
		)
		displayValor.displayWriting()
	}
	
	method limpiarDisplay() {
		displayRank.eraseWriting()
		displayValor.eraseWriting()
	}
}