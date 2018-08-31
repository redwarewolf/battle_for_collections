import soldadosHorda.*
import soldadosAlianza.*

object laHorda {
	
	var regiones = #{"Durotar","Mulgore","Tirisfal Glades"}
	var ejercito = #{sylvannasWindRunner, thrall,soldadoBruto}
	
	method reclutar(soldado){
		if(ejercito.lenght()<self.comida()){
			ejercito.add(soldado)
		}
	}
	method comida() {return 6}
	method ganaTerritorio(unTerritorio){
		regiones.add(unTerritorio)
	}
	method soldadoRandom() {
		return ejercito.random()
	}
	
	method pierdeElTerritorio(){
		var unTerritorio= regiones.anyOne()
		regiones.remove(unTerritorio)
		return unTerritorio
		
	}
	method oro() {
		return ejercito.sum{soldado => soldado.oro()}
	}
	method entregaRegiones(unaAlianza){
		unaAlianza.recibe(regiones)
		self.vaciarRegiones()
	}
	method vaciarRegiones(){
		regiones = #{}
	}
	method luchaContra(unaAlianza){
		if(self.leGanaA(unaAlianza)){
			unaAlianza.entregaRegiones(self)
		}
		else{
			self.entregaRegiones(unaAlianza)
		}	
	}
	method leGanaA(unaAlianza){
		return self.puntosTotales() >= unaAlianza.puntosTotales()
	}
	method puntosTotales() {return self.oro() + ejercito.sum{soldado => soldado.poder()}	
	}
}

object laAlianza {

	var oro=50000
	var regiones = #{"ElwynForest","Teldrassil","Dun Morogh"}
	var ejercito = #{anduin, jainaProudmoore,soldadoRazo}
	
	method reclutar(soldado){
		if(ejercito.lenght()<self.comida()){
			ejercito.add(soldado)
		}
	}	

	method comida() {return 8}
	method soldadoRandom() {
		return ejercito.random()
	}
	
	method pierdeElTerritorio(){
		var unTerritorio= regiones.anyOne()
		regiones.remove(unTerritorio)
		return unTerritorio
		
	}
	method ganaTerritorio(unTerritorio){
		regiones.add(unTerritorio)
	}
	method ganaOro(cantidad){
		oro+=cantidad
	}
	method oro() {return oro}

	method cobrarImpuestos(){
		ejercito.forEach{soldado => soldado.pagaImpuestos()}
	}
	method entregaRegiones(unaHorda){
		unaHorda.recibe(regiones)
		self.vaciarRegiones()
	}
	method vaciarRegiones(){
		regiones = #{}
	}
	method luchaContra(unaHorda){
		if(self.leGanaA(unaHorda)){
			unaHorda.entregaRegiones(self)
		}
		else{
			self.entregaRegiones(unaHorda)
		}	
	}
	method leGanaA(unaHorda){
		return self.puntosTotales() >= unaHorda.puntosTotales()
	}
	method puntosTotales() {return self.oro() + ejercito.sum{soldado => soldado.poder()}	
	}
	
}