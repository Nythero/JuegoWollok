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
				{ elemento => elemento.avanzar() }
			)
		} )
	}
}
