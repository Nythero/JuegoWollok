import math.*

object list {
	
	method ordenarAlAzar(lista){
		return if (lista == []) {
			[]
		}
		else {
			const elementoAEliminar = lista.anyOne()
			[].copyWith(elementoAEliminar) +
			self.ordenarAlAzar(lista.copyWithout(elementoAEliminar))
		}
	}
	
}
