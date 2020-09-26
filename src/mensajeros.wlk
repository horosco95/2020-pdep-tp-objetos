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
	//metodo agregado para 2da entrega
	method precio(){
		return 50
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
	const property pendientes = []
	method contratar(nuevoMensajero){
		mensajeros.add(nuevoMensajero)
	}
	method despedir(mensajero){
		mensajeros.remove(mensajero)
	}
	method despedirTodos(){
		mensajeros.clear()
	}
	method esMensajeriaGrande(){
		return mensajeros.size() > 2
	}
	method puedeEntregarElPrimero(unPaquete){
		return unPaquete.puedeSerEntregadoPor( mensajeros.first() )
	}
	method pesoUltimoMensajero(){
		return mensajeros.last().peso()
	}
	//Agregando requerimientos
	method algunoPuedeEntregar(unPaquete){
		return mensajeros.any( {mensajero => unPaquete.puedeSerEntregadoPor(mensajero)} )
	}
	method mensajerosQuePuedenLlevar(unPaquete){
		return mensajeros.filter( {mensajero => unPaquete.puedeSerEntregadoPor(mensajero)} )
	}
	method tieneSobrepeso(){
		var totalPeso = mensajeros.sum( {mensajero => mensajero.peso()} )
		var cantidadMensajeros = mensajeros.size()
		return totalPeso / cantidadMensajeros > 500
	}
	method enviar(unPaquete){
		if ( not self.algunoPuedeEntregar(unPaquete) )
      		self.pendientes(unPaquete)
	}
	method enviarTodos(paquetes){
		paquetes.forEach( {paquete => self.enviar(paquete)} )
	}
	method pendienteMasCaro(){
		var masCaro = pendientes.max( {paquete => paquete.precio() } )
		if ( self.algunoPuedeEntregar(masCaro) )
		{
			self.enviar(masCaro)
			pendientes.remove(masCaro)
		}
	}
	method pendientes(unPaquete) = pendientes.add(unPaquete)
	method mensajeros() = mensajeros
}
object paquetito{
	const property precio = 0
	method estaPago(){
		return true
	}
	method puedeSerEntregadoPor(mensajero){
		return true
	}
}
object paqueton{
	var destinos = []
	var pagado = 0
	
	method estaPago(){
		return pagado >= self.precio()
	}
	method puedeSerEntregadoPor(mensajero){
		return self.estaPago() && destinos.all({destino => destino.dejaPasarA(mensajero)})
	}
	method precio(){
		return destinos.size() * 100
	}
	method pagar(importe){
		pagado += importe
	}
	method destinos(nuevoDestino){
		destinos.add(nuevoDestino)
	}
}