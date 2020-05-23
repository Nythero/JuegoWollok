import wollok.game.*

object math {
	
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
	
	method numALista(n) {
		return
			if (n < 0)
				"Error: el nro debe ser mayor o igual a cero"
			else if (n < 10)
				[n]
			else
				self.numALista(n.div(10)) + [self.ultimoDigito(n)]
	}
	
	method ultimoDigito(n) {
		return (n - n.div(10) * 10)
	}
	
	
	//Agarra un numero random de 3 cifras y lo divide por el weight
	method randomByWeight(weight){
		var max = 10**(-3)/weight
		return 0.randomUpTo(max)
	}
}
