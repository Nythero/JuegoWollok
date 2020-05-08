import wollok.game.*

object randomizer {
	
	method elementoRandomDeLista(lista) {
		return lista.get(self.enteroRandomEntre(0, lista.size() - 1))
	}
	
	method enteroRandomEntre(e1, e2) {
		return self.listaDeEnterosEntre(e1, e2).anyOne()
	}
	
	method listaDeEnterosEntre(e1, e2) {
		return
			if (e1 > e2)
				"Error: el primer nro es mas grande que el segundo"
			else if (e1 == e2)
				[e2]
			else
				[e1] + self.listaDeEnterosEntre(e1 + 1, e2)
	}
}
