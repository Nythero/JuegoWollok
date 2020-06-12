object lista {
	
	//Proposito: Reemplaza el elemento1 por el elemento2
	//Si el elemento 1 no existe no hace nada
	method reemplazarPor(lista, e1, e2){
		if (lista.contains(e1)){
			lista.remove(e1)
			lista.add(e2)
		}
	}
	
	//Precondicion: El elemento con el id debe existir
	method encontrarPorId(lista, _id){
		return lista.filter({ elemento => elemento.id() == _id}).uniqueElement()
	}
	
}
