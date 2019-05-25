import Locales.*
import Canciones.*
import Bandas.*
import Musicos.*
import CobrosMusicos.*
import model.Albumes.*


class Presentacion
{
	var fecha 
	var lugar
	var artistas
	var banda
	
	constructor(_fecha, _lugar, listaArtistas,_banda)
	{
		fecha = _fecha
		lugar = _lugar
		artistas = listaArtistas
		banda = _banda
	}
	
	method fecha()
	{
		return fecha
	}	
	
	method lugar()
	{
		return lugar
	}
	
	method tocan()
	{
		return artistas
	}
	
	method banda()
	{
		return banda
	}
	
	method tocaSolo(artista)
	{
		return artistas.contains(artista) and artistas.size() == 1 
	}
	
	method sacarArtista(artista){
		
		artistas.remove(artista)
	}
	
	method agregarArtista(artista){
		
		artistas.add(artista)
	}
	
	method costo()
	{
		return artistas.sum({artista => artista.cobra(self)}) 
	}
	
	method costoEspecifico()
	{
		return artistas.sum({artista => artista.cobraEspecifico(self)}) + banda.cobra(self)
	}
		
	method concurrencia(){
		
		return lugar.capacidad(fecha) 
	}
	
	method esConcurrido()
	{		
		return self.concurrencia() > 5000
	}	
	
	method magia(){
		
		return artistas.sum({artista => artista.habilidad()}) + banda.habilidad()
	}
	
}

class HabilidadInsuficienteException inherits Exception {}
class ComponerCancionException inherits Exception {}
class EjecutarCancionException inherits Exception {}

object pdepalooza inherits Presentacion(fechaPdepalooza,lunaPark,#{},#{}){
	
	var fechaPdepalooza
	
	var alicia = new Cancion("","",0)
//	var ejecutarBienEstaCancion = alicia
//	
//	method cambiarEjecutarBienCancion(nuevaCancion){
//		
//		ejecutarBienEstaCancion = nuevaCancion
//	}
	
	override method agregarArtista(artista){
		
		if(artista.habilidad() < 70){
			
			throw new HabilidadInsuficienteException( "La habilidad debe ser mayor a 70" )
		}
		
		if(artista.noTieneCanciones()){
			
			throw new ComponerCancionException( "Debe poseer al menos una cancion" )
		}
		
		if(artista.ejecutaBienLaCancion(alicia)){
			
			artistas.add(artista)
			
		}else{
			
			throw new EjecutarCancionException( "Debe ejecutar bien la cancion Alicia" )
			
		}
		
		artistas.add(artista)
	}

}