import equipos.*
import soldadosHorda.*

object anduin{
	var oro=150000
	var poder = 4500

	method poder() {return poder}
	
	method oro(){return oro}
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
		if(self.leGanaA(laHorda.soldadoRandom())){
			self.conquistarRegion()
		}
	}
	method conquistarRegion(){
		laAlianza.ganaTerritorio(laHorda.pierdeElTerritorio())
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
	method pagaImpuestos(unaFaccion){
		unaFaccion.ganaOro(self.oro()/2)
		self.oro(self.oro()/2)
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
		if(self.leGanaA(laHorda.soldadoRandom())){
			self.conquistarRegion()
		}
	}
	method conquistarRegion(){
		laAlianza.ganaTerritorio(laHorda.pierdeElTerritorio())
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

	method pagaImpuestos(unaFaccion){
		unaFaccion.ganaOro(oro/2)
		self.oro(self.oro()/2)
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
		if(self.leGanaA(laHorda.soldadoRandom())){
			self.conquistarRegion()
		}
	}
	method conquistarRegion(){
		laAlianza.ganaTerritorio(laHorda.pierdeElTerritorio())
	}
	method leGanaA(otroPersonaje){
		return self.poder()>=otroPersonaje.poder()
	}
	method robarleA(otroPersonaje){
		otroPersonaje.esRobadoPor(self)
		estado = tranquilo
	}
	method esRobadoPor(otroPersonaje){
		otroPersonaje.ganaOro(self.oro())
		estado = enfurecido
		self.oro(0)
	}
	method ganarOro(cantidad){
		self.oro(self.oro()+cantidad)
	}

	method pagaImpuestos(unaFaccion){
		unaFaccion.ganaOro(oro/2)
		self.oro(self.oro()/2)
	}
}
