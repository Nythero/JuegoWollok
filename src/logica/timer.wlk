import wollok.game.*
import writer.*

class TimeableElement {
	var property inTiming = false
	var property position
	
	method image()
	method time()
	
	method startDisplay(_position) {
		position = _position
		game.addVisual(self)
	}
	
	method startTiming() {
		self.inTiming(true)
		timer.addTimedElement(self)
	}
	
	method stopTiming() {
		self.inTiming(false)
		timer.removeElement(self)
	}
	
	method activate()
}

object timer {
	
	const timedElements = []
	
	
	method addTimedElement(_element) {		
		const newTimedElement = new TimedElement(element = _element)		
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
	
	method removeElement(_element) {
		self.timedElementFromElement(_element).finishTiming()		
	}
	
	method timedElementFromElement(_element) {
		return timedElements.filter(
				{ timedElement => timedElement.element() == _element }
			).get(0)
	}
}

class TimedElement {
	const property element
	var timeShown = null
	var timeLeft = null
	
	method start() {
		
		element.inTiming(true)
		
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
		element.inTiming(false)
	}
	
	method keepTiming() {
		timeLeft -= 1
		timeShown.refreshWriting(timeLeft)
	}
}
