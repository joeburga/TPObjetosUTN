import Musicos.*
import Presentaciones.*
import Canciones.*
import Locales.*


class Banda {
	
	var musicos 
	var representanteCobro
	constructor(_musicos,_representanteCobro){
		
		musicos = _musicos
		representanteCobro = _representanteCobro
	}
	
	method habilidad(){
		
		return musicos.sum({musico => musico.habilidad()}) + musicos.sum({musico => musico.habilidad()})*0.1
	}

	method sacarMusico(musico){
		
		 musicos.remove(musico)
	}
	
	method cobra(presentacion){
		
		return musicos.sum({musico => musico.cobraEspecifico(presentacion)}) + representanteCobro
	}
	
	method ejecutaBienLaCancion(cancion){
		
		return musicos.all{musico => musico.cantaBien(cancion)}
	}
}
