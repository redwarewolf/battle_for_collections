import soldadosHorda.*
import soldadosAlianza.*

object laHorda {
	
	var comida = 6
	
	var regiones = #{"Durotar","Mulgore","Tirisfal Glades"}
	var ejercito = #{sylvannasWindRunner, thrall,soldadoBruto}
	
	method reclutar(soldado){
		if(self.puedeReclutarSoldado()){
			ejercito.add(soldado)
		}
	}
	
	method puedeReclutarSoldado(){
		return ejercito.lenght() < self.comida()
	}
	
	method comida() {return comida}
	
	method ganaTerritorio(unTerritorio){
		regiones.add(unTerritorio)
	}
	
	method soldadoRandom() {
		return ejercito.random()
	}
	
	method pierdeElTerritorio(){
		var unTerritorio = regiones.anyOne()
		regiones.remove(unTerritorio)
		return unTerritorio
	}
	
	method oro() {
		return ejercito.sum{soldado => soldado.oro()}
	}
	
	method entregaRegiones(unaFaccion){
		unaFaccion.recibe(regiones)
		self.vaciarRegiones()
	}
	
	method vaciarRegiones(){
		regiones = #{}
	}
	
	method luchaContra(unaFaccion){
		if(self.leGanaA(unaFaccion)){
			unaFaccion.entregaRegiones(self)
		}
		else{
			self.entregaRegiones(unaFaccion)
		}	
	}
	
	method leGanaA(unaFaccion){
		return self.puntosTotales() >= unaFaccion.puntosTotales()
	}
	
	method poderEjercito(){
		return ejercito.sum{soldado => soldado.poder()}
	}
	
	method puntosTotales() {return self.oro() + self.poderEjercito()}
}

object laAlianza {

	var oro=50000
	var comida = 8
	var regiones = #{"ElwynForest","Teldrassil","Dun Morogh"}
	var ejercito = #{anduin, jainaProudmoore,soldadoRazo}
	
	method reclutar(soldado){
		if(self.puedeReclutarSoldado()){
			ejercito.add(soldado)
		}
	}
	
	method puedeReclutarSoldado(){
		return ejercito.lenght() < self.comida()
	}

	method comida() {return comida}
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
		ejercito.forEach{soldado => soldado.pagaImpuestos(self)}
	}
	method entregaRegiones(unaFaccion){
		unaFaccion.recibe(regiones)
		self.vaciarRegiones()
	}
	method vaciarRegiones(){
		regiones = #{}
	}
	method luchaContra(unaFaccion){
		if(self.leGanaA(unaFaccion)){
			unaFaccion.entregaRegiones(self)
		}
		else{
			self.entregaRegiones(unaFaccion)
		}	
	}
	method leGanaA(unaFaccion){
		return self.puntosTotales() >= unaFaccion.puntosTotales()
	}

	method poderEjercito(){
		return ejercito.sum{soldado => soldado.poder()}
	}
	
	method puntosTotales() {return self.oro() + self.poderEjercito()}	
}