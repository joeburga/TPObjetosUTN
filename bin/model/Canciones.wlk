import Albumes.*

class Cancion
{
	var titulo
	var duracion
	var letra
	
	constructor(_titulo,_letra, _duracion)
	{
		titulo = _titulo
		duracion = _duracion
		letra = _letra
	}
	
	method titulo()
	{
		return titulo
	}
	method duracion()
	{
		return duracion
	}
	
	method letra()
	{
		return letra
	}
	
	method esCorta(){
		
		return duracion < 180
	}
	
	method convertirLetra(){
		
		return letra.toLowerCase()
	}
		
	method contienePalabra(unaPalabra){
		
		return self.convertirLetra().contains(unaPalabra.toLowerCase())
	}
	
	method largoDe(criterio){
		
		return criterio.depende(self)
	}
	
}

object laDuracion {
	
	method depende(cancion){
		
		return cancion.duracion()
	}
}

object laLetra {
	
	method depende(cancion){
		
		return cancion.letra().length()
	}
}

object elTitulo {
	
	method depende(cancion){
		
		return cancion.titulo().length()
	}
}


class Remix inherits Cancion{

  	var cancionRemixada 
  	
 constructor(tituloRemix,_cancionRemixada) = super(tituloRemix,"",0)
 
  	{
  		cancionRemixada  = _cancionRemixada 
  	}
 	 	
 	override method duracion()
 	{
 		return cancionRemixada.duracion() * 3
  	}
  	
 	override method letra()
 
  	{
 		return "mueve tu cuelpo baby" + " " + cancionRemixada.letra() + " " + "yeah oh yeah"
  	}
 }
  
  
class Mashup inherits Cancion{
	
	var canciones
	var letraMashup = ""
		
	constructor(tituloMashup,_canciones) = super(tituloMashup,"",0)
	{
		canciones  = _canciones 		
	}
	
	override method duracion()
	{
		return (canciones.max{cancion => cancion.duracion()}).duracion()
	}
	
	method agregarLetra(unaLetra)
	{
		letraMashup += unaLetra
	}
	
	method combinarLetra()
	{
	 	canciones.forEach({cancion => self.agregarLetra(cancion.letra())})
	}
	
	override method letra()
	{
		self.combinarLetra()
		return letraMashup
	}
}

//object alicia inherits Cancion("Cancion de Alicia en el pais","Quien sabe Alicia, este pais no estuvo hecho porque si. Te vas a ir, vas a salir pero te quedas, ¿donde mas vas a ir? Y es que aqui, sabes el trabalenguas, trabalenguas, el asesino te asesina, y es mucho para ti. Se acabo ese juego que te hacia feliz.",510){
//	
//}	