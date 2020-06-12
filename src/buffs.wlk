import logica.detector.*

class Buff { 
	
	method accionar(jugador)
	
	method estadoOpuesto()
	
	method id()
}

object escudoB inherits Buff{
	
	override method accionar(jugador){
		jugador.perderBuff(self)
	}
	
	override method estadoOpuesto(){
		return noEscudoB
	}
	
	method id(){
		return "escudo"
	}
	
	method duracion(){
		return 3000
	}
}

object noEscudoB inherits Buff{
	
	override method accionar(jugador){
		detector.cambiarEstado()
	}
	
	override method estadoOpuesto(){
		return escudoB
	}
	
	method id(){
		return "escudo"
	}
}