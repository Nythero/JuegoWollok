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
	
	method endDisplay() {
		if (game.hasVisual(self)) {
			game.removeVisual(self)
		}		
	}
	
	method startTiming() {
		self.inTiming(true)
		timer.addTimedElement(self)
	}
	
	method stopTiming() {
		self.inTiming(false)
	}
	
	method activate()
}

object timer {
	
	const property timedElements = []
	
	
	method addTimedElement(_element) {		
		const newTimedElement = new TimedElement(element = _element)		
		newTimedElement.start()
		
		timedElements.add(newTimedElement)		
	}
	
	
	method start() {
		self.clearElements()
		game.onTick(1000, "process timed elements", { self.processElements() } )
	}
	
	method clearElements() {
		timedElements.forEach(
			{ timedElement => 
				timedElement.element().stopTiming()
				self.removeTimedElement(timedElement)
			}
		)
	}
	
	method clear(timedElement) {
		self.removeTimedElement(timedElement)
		timedElement.forceRemoveTiming()
		timedElement.element().inTiming(false)
	}
	
	
	method processElements() {
		timedElements.forEach(
			{ timedElement => timedElement.processTiming() }
		)
	}
	
	method removeTimedElement(timedElement) {
		timedElements.remove(timedElement)
		
	}
	
	method forceRemoveElement(element) {
		self.clear(self.timedElementFromElement(element))
	}
	
	method timedElementFromElement(_element) {
		return timedElements.filter(
				{ timedElement => timedElement.element() == _element }
			).get(0)
	}
	
	method refreshPositions() {
		timedElements.forEach(
			{ timedElement => timedElement.refreshPosition() }
		)
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
		element.stopTiming()
		self.removeTiming()
	}
	
	method removeTiming() {
		if (timer.timedElements().contains(self)) {
			timeShown.eraseWriting()
			timer.removeTimedElement(self)
		}
	}
	
	method forceRemoveTiming() {
		timeShown.eraseWriting()
		timer.removeTimedElement(self)		
	}
	
	method keepTiming() {
		timeLeft -= 1
		timeShown.refreshWriting(timeLeft)
		self.refreshPosition()
	}
	
	method refreshPosition() {
		timeShown.refreshWritingPosition(element.position())
	}
}
