object paquete {
	var estaPago = false
	var destino
	method asignarDestino(nuevoDestino){
		destino = nuevoDestino
	}
	method puedeSerEntregadoPor(mensajero){
		return destino.dejaPasarA(mensajero) && self.estaPago()
	}
	method estaPago() = estaPago
	method pagado(){
		estaPago = true
	}
	//metodo agregado para 2da entrega
	method precio() = 50
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
	var transporte
	method viajaEn(nuevoTransporte){
		transporte = nuevoTransporte
	}
	method transporte() = transporte
	method peso() = 90 + transporte.peso()
	method puedeLlamar(){
		return false
	}
}

object chuckNorris{
	method peso() = 900
	method puedeLlamar(){
		return true
	}
}
object neo{
	var credito = 0
	
	method peso() = 0
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
	const property peso = 1
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
		const totalPeso = mensajeros.sum( {mensajero => mensajero.peso()} )
		const cantidadMensajeros = mensajeros.size()
		return totalPeso / cantidadMensajeros > 500
	}
	method enviar(unPaquete){
		if ( not self.algunoPuedeEntregar(unPaquete) )
      		self.almacenarComoPendiente(unPaquete)
	}
	method enviarTodos(paquetes){
		paquetes.forEach( {paquete => self.enviar(paquete)} )
	}
	method enviarPendienteMasCaro(){
		const masCaro = pendientes.max( {paquete => paquete.precio() } )
		self.enviar(masCaro)
		pendientes.remove(masCaro)
	}
	method almacenarComoPendiente(unPaquete) = pendientes.add(unPaquete)
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
	const destinos = []
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