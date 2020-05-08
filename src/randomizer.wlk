import wollok.game.*

object randomizer {
	
	method elementoRandomDeLista(lista) {
		return lista.get(self.enteroRandomEntre(0, lista.size()))
	}
	
	method enteroRandomEntre(e1, e2) {
		return [e1..e2].anyOne()
	}
}
