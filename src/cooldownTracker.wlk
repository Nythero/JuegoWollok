import wollok.game.*
import writer.*

object cooldownTracker {
	
	const itemsEnCooldown = []
	
	
	method agregarItemEnCooldown(_item) {		
		const nuevoItemEnCooldown = new ItemEnCooldown(item = _item)		
		nuevoItemEnCooldown.inicializar()
										
		itemsEnCooldown.add(nuevoItemEnCooldown)		
	}
	
	
	method inicializar() {
		itemsEnCooldown.clear()
		game.onTick(1000, "procesar cooldowns", { self.procesarCooldowns() } )
	}
	
	method limpiarItems() {
		itemsEnCooldown.forEach(
			{ itemEnCooldown => itemEnCooldown.finalizarCooldown() }
		)
	}
	
	
	method procesarCooldowns() {
		itemsEnCooldown.forEach(
			{ itemEnCooldown => itemEnCooldown.procesarCooldown() }
		)
	}
	
	method sacarElementoEnCooldown(itemEnCooldown) {
		itemsEnCooldown.remove(itemEnCooldown)
		
	}
}

class ItemEnCooldown {
	const property item
	var cooldownMostrado = null
	var cooldownRestante = null
	
	method inicializar() {
		
		item.enCooldown(true)
		
		cooldownRestante = item.tiempoDeCooldown()
				
		cooldownMostrado = new Writing(
			writing = cooldownRestante,
			position = item.position()
		)
		
		cooldownMostrado.displayWriting()
	}
	
	
	method procesarCooldown() {
		if (cooldownRestante == 0) {
			self.finalizarCooldown()
		}
		else {
			self.continuarCooldown()
		}
	}
	
	method finalizarCooldown() {
		cooldownMostrado.eraseWriting()
		cooldownTracker.sacarElementoEnCooldown(self)
		item.desactivarCooldown()
	}
	
	method continuarCooldown() {
		cooldownRestante -= 1
		cooldownMostrado.refreshWriting(cooldownRestante)
	}
}
