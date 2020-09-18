object paquete {
	var estaPago = false
	var destino
	method asignarDestino(nuevoDestino){
		destino = nuevoDestino
	}
	method puedeSerEntregadoPor(mensajero){
		return destino.dejaPasarA(mensajero) && self.estaPago()
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
		return persona.peso()<= 1000
	}
}

object laMatrix{
	method dejaPasarA(persona){
		return persona.puedeLlamar()
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
		if(transporte != null)
			return peso+transporte.peso()
		else 
			return peso
	}
	method puedeLlamar(){
		return false
	}
}

object chuckNorris{
	var peso = 900
	method peso(){
		return peso
	}
	method puedeLlamar(){
		return true
	}
}
object neo{
	//var peso = 0
	var credito = 0
	
	method peso(){
		return 0
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
		return 500*numAcoplados
	}
	method agregarAcoplado(){
		numAcoplados ++
	}
	
}
object bici{
	var peso = 1
	method peso(){
		return peso
	}
}
//Objetos - 2da Entrega
object mensajeria{
	const mensajeros = []
	
	method contratar(nuevoMensajero){
		mensajeros.add(nuevoMensajero)
	}
	method despedir(mensajero){
		
	}
	method despedirTodos(){
		
	}
	method esMensajeriaGrande(){
		return true
	}
	method puedeEntregarElPrimero(){
		
		return true
	}
	method pesoUltimoMensajero(){
		return 0
	}
}
object paquetito{
	
}
object paqueton{
	
}