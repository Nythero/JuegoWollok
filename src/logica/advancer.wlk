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
}
