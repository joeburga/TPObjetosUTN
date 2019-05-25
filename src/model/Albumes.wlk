
class Album 
{
	var nombreAlbum
	var fechaLanzamiento
	var cantidadCDs
	var cantidadVentas
	var canciones

	
	constructor(_nombreAlbum,_fechaLanzamiento,_cantidadCDs,_cantidadVentas,_canciones){
		nombreAlbum = _nombreAlbum
		fechaLanzamiento = _fechaLanzamiento
		cantidadCDs = _cantidadCDs
		cantidadVentas = _cantidadVentas
		canciones = _canciones
	}
	
	method nombreAlbum(){
		
		return nombreAlbum		
	}	
	
	method fechaLanzamiento(){
		
		return fechaLanzamiento
	}
	
	method cantidadCDs(){
		
		return cantidadCDs
	}
	
	method cantidadVentas(){
		
		return cantidadVentas
	}
	
	method canciones(){
		
		return canciones
	}
	
	method todasSusCancionesSonCortas(){
		
		return canciones.all{cancion => cancion.esCorta()}
	}
	
	method duracionTotal(){
		
		return canciones.sum({cancion => cancion.duracion()})
	}
	
	method tieneBuenasVentas(){
		
		return cantidadVentas > cantidadCDs * 0.75
	}
	
	method cancionesConPalabra(palabra){
		
		return canciones.filter({cancion => cancion.contienePalabra(palabra)})
	}
			
	method tieneLaCancion(cancion){
		
		return canciones.contains(cancion)
	}
	
	method cancionMasLargaSegun(criterio){
		
		return canciones.max{cancion => cancion.largoDe(criterio)}
		
	}
}
