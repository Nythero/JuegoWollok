import wollok.game.*
import writer.*

class Timer {
	
	const timedElements = []
	
	
	method addTimedElement(_element) {		
		const newTimedElement = new TimedElement(element = _element, timer = self)		
		newTimedElement.start()
										
		timedElements.add(newTimedElement)		
	}
	
	
	method start() {
		timedElements.clear()
		game.onTick(1000, "process timed elements", { self.processElements() } )
	}
	
	method clearElements() {
		timedElements.forEach(
			{ timedElement => timedElement.finishTiming() }
		)
	}
	
	
	method processElements() {
		timedElements.forEach(
			{ timedElement => timedElement.processTiming() }
		)
	}
	
	method removeTimedElement(timedElement) {
		timedElements.remove(timedElement)
		
	}
}

object cooldownTracker inherits Timer {
	
}

class TimedElement {
	const property element
	const property timer
	var timeShown = null
	var timeLeft = null
	
	method start() {
		
		element.turnOnTiming()
		
		timeLeft = element.time()
				
		timeShown = new Writing(
			writing = timeLeft,
			position = element.position()
		)
		
		timeShown.displayWriting()
	}
	
	
	method processTiming() {
		if (timeLeft == 0) {
			self.finishTiming()
		}
		else {
			self.keepTiming()
		}
	}
	
	method finishTiming() {
		timeShown.eraseWriting()
		timer.removeTimedElement(self)
		element.turnOffTiming()
	}
	
	method keepTiming() {
		timeLeft -= 1
		timeShown.refreshWriting(timeLeft)
	}
}
