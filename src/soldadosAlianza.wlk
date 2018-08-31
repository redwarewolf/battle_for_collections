import equipos.*
import soldadosHorda.*

object anduin{
	var oro=150000

	method poder() {return 4500}
	
	method oro(){return oro}
	method oro(cantidad){oro=cantidad
	}

	method pelearCon(otroPersonaje){
		if(self.leGanaA(otroPersonaje)){
			self.robarleA(otroPersonaje)
		}
		else{
			self.esRobadoPor(otroPersonaje)
		}
	}
	method pelearPorRegion(){
		var enemigo= laAlianza.soldadoRandom()
		if(self.leGanaA(enemigo)){
			self.conquistarRegion()
		}
		
	}
	method conquistarRegion(){
		laHorda.ganaTerritorio(laAlianza.pierdeElTerritorio())
	}
	method leGanaA(otroPersonaje){
		return self.poder()>=otroPersonaje.poder()
	}
	method robarleA(otroPersonaje){
		otroPersonaje.esRobadoPor(self)
	}
	method esRobadoPor(otroPersonaje){
		otroPersonaje.ganaOro(self.oro())
		self.oro(0)
	}
	method ganarOro(cantidad){
		self.oro(self.oro()+cantidad)
	}
	method pagaImpuestos(){
		laAlianza.ganaOro(self.pagaTarifa())
	}
	method pagaTarifa(){
		var cantidad= self.oro()/100*30
		oro-=cantidad
		return cantidad
	}
}

object jainaProudmoore{

	var oro=650

	method oro(){return oro}
	method poder() {return 7500}


	method oro(cantidad){oro=cantidad}

	method pelearCon(otroPersonaje){
		if(self.leGanaA(otroPersonaje)){
			self.robarleA(otroPersonaje)
		}
		else{
			self.esRobadoPor(otroPersonaje)
		}
	}
	method pelearPorRegion(){
		var enemigo= laAlianza.soldadoRandom()
		if(self.leGanaA(enemigo)){
			self.conquistarRegion()
		}
		
	}
	method conquistarRegion(){
		laHorda.ganaTerritorio(laAlianza.pierdeElTerritorio())
	}
	method leGanaA(otroPersonaje){
		return self.poder()>=otroPersonaje.poder()
	}
	method robarleA(otroPersonaje){
		otroPersonaje.esRobadoPor(self)
	}
	method esRobadoPor(otroPersonaje){
		otroPersonaje.ganaOro(self.oro())
		self.oro(0)
	}
	method ganarOro(cantidad){
		self.oro(self.oro()+cantidad)
	}


	method pagaImpuestos(){
		laAlianza.ganaOro(self.pagaTarifa())
	}
	method pagaTarifa(){
		var cantidad= self.oro()/100*30
		oro-=cantidad
		return cantidad
	}


}

object soldadoRazo{
	var oro=35
	var estado = tranquilo

	method oro(){return oro}
	method poder() {return estado.poder()}
	method estado(unEstado) {estado=unEstado}
	method cambiarEstado() {self.estado(estado.otroEstado())}

	method oro(cantidad){oro=cantidad}

	method pelearCon(otroPersonaje){
		if(self.leGanaA(otroPersonaje)){
			self.robarleA(otroPersonaje)
		}
		else{
			self.esRobadoPor(otroPersonaje)
		}
	}
	method pelearPorRegion(){
		var enemigo= laAlianza.soldadoRandom()
		if(self.leGanaA(enemigo)){
			self.conquistarRegion()
		}
		
	}
	method conquistarRegion(){
		laHorda.ganaTerritorio(laAlianza.pierdeElTerritorio())
	}
	method leGanaA(otroPersonaje){
		return self.poder()>=otroPersonaje.poder()
	}
	method robarleA(otroPersonaje){
		otroPersonaje.esRobadoPor(self)
	}
	method esRobadoPor(otroPersonaje){
		otroPersonaje.ganaOro(self.oro())
		self.oro(0)
	}
	method ganarOro(cantidad){
		self.oro(self.oro()+cantidad)
	}


	method pagaImpuestos(){
		laAlianza.ganaOro(self.pagaTarifa())
	}
	method pagaTarifa(){
		var cantidad= self.oro()/100*30
		oro-=cantidad
		return cantidad
	}

}
