import wollok.game.*
import configuracion.*
import buffs.*
import suplementarios.list.*

object personaje {
	
	//Atributos
	
	var property position = game.at(2,0)
	
	const property buffsPresentes = #{}
	
	//Atributos
	
	//Metodos
	
	
	method image() {
		return 
			if (self.tieneBuff(escudoB))
				"autoRojoConEscudo.png"
			else
				"auto_rojo2.png"
	}
	
	method iniciar(){
		buffsPresentes.add(noEscudoB)
		position = game.at(2,0)
		game.addVisual(self)
	}
	
	method moverHacia(x){
		position = game.at((position.x() + x).max(0).min(configuracion.trackWidth() - 1) , position.y())
	}
	
	method tieneBuff(buff){
		return buffsPresentes.contains(buff)
	}
	
	method chocar(otro){
		self.escudo().accionar(self)
	}
	
	//Precondicion: El buff tiene que estar activado
	method perderBuff(buff){
		lista.reemplazarPor(buffsPresentes, buff, buff.estadoOpuesto())
	}
	
	//Precondicion: El buff tiene que estar desactivado
	//Proposito: Activa el buff 
	method ganarBuff(buff){
		lista.reemplazarPor(buffsPresentes, buff.estadoOpuesto(), buff)		
		game.schedule(buff.duracion(), { self.perderBuff(buff)})
	}
	
	method escudo(){
		return lista.encontrarPorId(buffsPresentes, "escudo")
	}
	//Metodos
}
