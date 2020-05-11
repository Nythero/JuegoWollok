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
		return ( {
			elementosQueAvanzan.forEach(
				{ elemento => self.avanzarElemento(elemento) }
			)
		} )
	}
	
	method avanzarElemento(elemento) {
		if (elemento.position().y() == 0) {
			spawner.despawnear(elemento)
		}
		else {
			elemento.position(elemento.position().down(1))
		}
	}
}
