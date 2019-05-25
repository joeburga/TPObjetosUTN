import Canciones.*
import Presentaciones.*

object lunaPark
{
	const capacidad = 9290
	
	method capacidad(fecha)
	{
		 return capacidad
	}
}

object trastienda
{
	const plantaBaja = 400
	const primerPiso = 300	
	
	method capacidadPrimerPiso(fecha)
	{
		 if (fecha.dayOfWeek() == 6){
		 	return primerPiso
		 }else {
		 	return 0
		 }
	}
	
	method capacidad(fecha)
	{
		return plantaBaja + self.capacidadPrimerPiso(fecha)
	}
}

class Lugar {
	
	var capacidad
	
	constructor(_capacidad){
		
		capacidad = _capacidad
	}
	
	method capacidad(fecha)
	{
		return capacidad
	}
}