
class Monto {
	
	method cobrar(presentacion){
		
		if(self.condicionDeCobro(presentacion)){
			
			return self.montoDeCondicionCumplida()
		
		}else{
			
			return self.montoDeCondicionNoCumplida()
		}
	}
	
	method condicionDeCobro(presentacion)
	method montoDeCondicionCumplida()
	method montoDeCondicionNoCumplida()
}

class TocaSolo inherits Monto {
	
	var monto 
	
	constructor(_monto)
	{
		monto = _monto
	}
	override method condicionDeCobro(presentacion) = presentacion.tocaSolo(self);
	override method montoDeCondicionCumplida() = monto
	override method montoDeCondicionNoCumplida() = monto / 2

}

class Capacidad inherits Monto {
	
	var monto 
	var capacidad 
	
	constructor(_monto,_capacidad)
	{
		monto = _monto
		capacidad = _capacidad
	}
	override method condicionDeCobro(presentacion) = presentacion.concurrencia() > capacidad;
	override method montoDeCondicionCumplida() = monto
	override method montoDeCondicionNoCumplida() = monto - 100	

}

class Inflacion inherits Monto{
	
	var monto 
	var fecha
	var inflacion
	
	constructor(_monto,_fecha,_inflacion)
	{
		monto = _monto
		fecha = _fecha
		inflacion = _inflacion
	}
	
	override method condicionDeCobro(presentacion) = (presentacion.fecha() <= fecha)
	override method montoDeCondicionCumplida() = monto
	override method montoDeCondicionNoCumplida() = monto + monto*inflacion
	
}
