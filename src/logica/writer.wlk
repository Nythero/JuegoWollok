import wollok.game.*
import suplementarios.numbers.*
import suplementarios.math.*

class Writing {
	var writing
	const position
	var displayedWriting = []
	
	method refreshWriting(_writing) {
		writing = _writing
		self.eraseWriting()
		self.displayWriting()
	}
	
	method eraseWriting() {
		displayedWriting.forEach(
			{ digit => game.removeVisual(digit) }
		)
	}
	
	method displayWriting() {
		var n = 0
		displayedWriting = self.writingToDisplay()
		
		displayedWriting.reverse().forEach({
			digit =>
				game.addVisualIn(digit, game.at(position.x() - n, position.y()))
				n++
			}
		)
	}
	
	method writingToDisplay() {
		return self.writingAsList().map(
			{ digit => new Num(n = digit) }
		)
	}
	
	method writingAsList() {
		return math.numALista(writing)
	}
}
