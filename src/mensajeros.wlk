object paquete {
	var estaPago = false
	var destino
	method asignarDestino(nuevoDestino){
		destino = nuevoDestino
	}
	method puedeSerEntregadoPor(mensajero){
		return true
	}
	method estaPago(){
		return estaPago
	}
	method pagado(){
		estaPago = true
	}
}
//	Destinos
object puenteDeBrooklyn{
	method dejaPasarA(persona){
		return true
	}
}

object laMatrix{
	method dejaPasarA(persona){
		return true
	}
}
//	Mensajeros
object roberto{
	var peso = 90
	var transporte
	method viajaEn(nuevoTransporte){
		transporte = nuevoTransporte
	}
	method transporte(){
		return transporte
	}
	method peso(){
		
	}
}

object chuckNorris{
	var peso = 900
	method peso(){
		return peso
	}
}
object neo{
	var peso = 0
	var credito = 0
	
	method peso(){
		return peso
	}
	method agregarCredito(monto){
		credito = credito + monto
	}
	method puedeLlamar(){
		return credito > 0
	}
}
//	Medio de transporte
object camion{
	var numAcoplados = 0
	method numAcoplados(){
		return numAcoplados
	}
	method peso(){
		return 
	}
	method agregarAcoplado(){
		numAcoplados ++
	}
	
}
object bici{
	var peso = 1
	method peso(){
		
	}
}