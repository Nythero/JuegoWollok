import cronometrados.tienda.*
import cronometrados.timer.*
import configuracion.*
import wollok.game.*

object buffTracker {
	const buffs = #{}
	
	const width = 5
	const height = 1
	
	const posicion = game.at(
		configuracion.gameWidth() - width,
		tienda.position().y() + 1 + height
	)
	
	method iniciar() {}
	
	method limpiar() {
		buffs.forEach(
			{ buff => self.removeBuff(buff) }
		)
	}
	
	method addBuff(buff) {
		self.removeBuffType(buff.type())
		self.show(buff)
		buffs.add(buff)
		buff.gain()
	}
	
	method show(buff) {
		if (buffs.contains(buff)) {
			buff.startDisplay(buff.position())
		}
		else {
			buff.startDisplay(self.nextSlot())
		}
	}
	
	method removeBuff(buff) {
		buff.lose()
		buffs.remove(buff)
		self.refreshBuffs()
	}
	
	method forceRemoveBuff(buff) {
		buff.forceLose()
		buffs.remove(buff)
		self.refreshBuffs()
	}
	
	method nextSlot() {
		return self.slot(buffs.size())
	}

	method refreshBuffs() {
		var n = 0
		
		buffs.forEach({
			buff =>
				buff.refreshPosition(self.slot(n))
				n++
			}
		)
		
		timer.refreshPositions()
	}
	
	method removeBuffType(type) {
		self.buffsWithType(type).forEach(
			{ buff =>
				
				self.removeBuff(buff)
			}
		)
	}
	
	method softRemoveBuff(buff) {
		buff.lose()
		buffs.remove(buff)
	}
	
	method buffsWithType(type) {
		return
			buffs.filter(
				{ buff => buff.type() == type }
			)
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
	method contains(_item) {
		return buffs.contains(_item)
	} 
}
