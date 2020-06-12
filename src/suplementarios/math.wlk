object math {
	
	method enteroRandomEntre(e1, e2) {
		return (e1..e2).anyOne()
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
		const max = 10**(-3)/weight
		return 0.randomUpTo(max)
	}
}
