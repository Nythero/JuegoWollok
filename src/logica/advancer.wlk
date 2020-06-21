import spawner.*

object advancer {
	const property elementosQueAvanzan = []
	
	method agregarElementoQueAvanza(elemento) {
		elementosQueAvanzan.add(elemento)
	}
	
	method sacarElementoQueAvanza(elemento) {
		elementosQueAvanzan.remove(elemento)
	}
	
	method avanzar() {
		elementosQueAvanzan.forEach(
		  { elemento => elemento.avanzar() }
		)
	}
	
	method start(){
		elementosQueAvanzan.clear()
	}
	
	method eliminarEnemigos() {
		self.enemigos().forEach(
			{ enemigo => spawner.despawnear(enemigo) }
		)
	}
	
	method enemigos() {
		return
			elementosQueAvanzan.filter(
				{ elemento => elemento.esDesfavorable() }
			)
	}
}
