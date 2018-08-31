import equipos.*


object thrall{


	method poder() {return 9999}
	
	method oro(){return 0}
	method oro(cantidad){//oro=cantidad
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
	
}

object sylvannasWindRunner{

	var oro=5000

	method oro(){return oro}
	method poder() {return 5000}


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



}

object soldadoBruto{
	var oro=25
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


}

object tranquilo {
	method poder() {return 200}
	method otroEstado() {return enfurecido}
}

object enfurecido {
	method poder() {return 300}
	method otroEstado() {return tranquilo}
}