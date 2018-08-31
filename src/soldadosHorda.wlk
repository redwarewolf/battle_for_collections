import equipos.*
import soldadosAlianza.*

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
		if(self.leGanaA(laAlianza.soldadoRandom())){
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
		if(self.leGanaA(laAlianza.soldadoRandom())){
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
		if(self.leGanaA(laAlianza.soldadoRandom())){
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


}

object tranquilo {
	method poder() {return 200}
}

object enfurecido {
	method poder() {return 300}
}