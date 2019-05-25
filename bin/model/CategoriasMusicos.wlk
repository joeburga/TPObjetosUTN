
class Larguero {
	
	var segundos
	
	constructor(_segundos){
		
		segundos = _segundos
	}
	
	method cantaBien(cancion){
		
		return cancion.duracion() > segundos
	}
}

class Imparero {
	
	method cantaBien(cancion){
		
		return cancion.duracion().odd()
	}
}

class Palabrero {
	
	var palabra
	
	constructor(_palabra){
		
		palabra = _palabra
	}
	
	method cantaBien(cancion){
		
		return cancion.contienePalabra(palabra)
	}
}

