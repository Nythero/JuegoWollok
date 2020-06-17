import tienda.*
import configuracion.*
import wollok.game.*
import timer.*

object buffTracker {
	const buffs = #{}
	
	const width = 5
	const height = 1
	
	const posicion = game.at(
		configuracion.gameWidth() - width,
		tienda.position().y() + 1 + height
	)
	
	method addBuff(buff) {
		buff.clear()
		buffs.add(buff)
		buff.startDisplay(self.nextSlot())
		buff.gain()
	}
	
	method removeBuff(buff) {
		buff.lose()
		self.refreshBuffs()
		buffs.remove(buff)
	}

	method refreshBuffs() {
		var n = 0
		
		buffs.forEach({
			item =>
				item.refreshPosition(self.slot(n))
				n++
			}
		)
	}
	
	method nextSlot() {
		return self.slot(buffs.size() - 1)
	}
	
	method slot(n) {
		return game.at(self.coordSlotX(n), self.coordSlotY(n))
	}
	
	method coordSlotY(n) {
		return posicion.y() - n.div(width)
	}
	
	method coordSlotX(n) {
		return posicion.x() + n % width
	}
}
