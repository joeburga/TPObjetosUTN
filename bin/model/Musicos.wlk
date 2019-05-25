import Guitarras.*
import Canciones.*
import CategoriasMusicos.*
import CobrosMusicos.*


class Musico {
	
	var habilidad 
	var albumes
	var grupo
	var tipoCobro
	var tipoMusico
	
	constructor(_habilidad,_albumes,_grupo)
	{
		habilidad = _habilidad
		albumes = _albumes
		grupo = _grupo
	}
	
	method habilidad()	
	
	method tipoDeCobro(criterio){
		
		tipoCobro = criterio
	}

	method tipoDeMusico(criterio){
		
		tipoMusico = criterio
	}

	method albumes()
	{
		return albumes
	}
	
	method dejarGrupo()
	{	
//		grupo.sacarMusico(self)
		grupo = null
	}
	
	method nuevoGrupo(nuevoGrupo)
	{
		grupo = nuevoGrupo
	}	
	
	method esSolista(presentacion)
	{
		return presentacion.tocaSolo(self)
	}
	
	method minimalista()
	{
		return albumes.all{album => album.todasSusCancionesSonCortas()}
	}
	
	method duracionObra()
	{
		return albumes.sum({album => album.duracionTotal()})
	}
	
	method laPego(){
		
		return albumes.all{album => album.tieneBuenasVentas()}
	}
	
	method noTieneCanciones(){
		
		return albumes.isEmpty()
	}
	
	method queCancionesContienenLaPalabra(palabra){
		
		return albumes.flatMap({album => album.cancionesConPalabra(palabra)})		
	}	
	
	method esDeSuAutoria(cancion){
		
		return albumes.flatMap({album =>album.canciones()}).contains(cancion)		
	}
	
	method laInterpretaBienEspecifico(cancion)
		
	method ejecutaBienLaCancion(cancion)
	{
		return self.laInterpretaBienEspecifico(cancion) or self.habilidad() > 60
	}
	
	method queCancionesPuedeTocar(listaCanciones){
		
		return listaCanciones.filter{cancion => self.cantaBien(cancion)}
	}
	
	method cobraEspecifico(presentacion){
		
		return tipoCobro.cobrar(presentacion)
	}
	
	method cantaBien(cancion)
	{
		return self.esDeSuAutoria(cancion) or self.habilidad() > 60  or tipoMusico.cantaBien(cancion)
	}
}

class MusicoDeGrupo inherits Musico {
	
	const aumento
	
	constructor(_aumento,_habilidad,_albumes,_grupo) = super(_habilidad,_albumes,_grupo)
	{
		aumento = _aumento		
	}
	
	method aumento()
	{
		return aumento
	}
	
	method puntajePorGrupo()
	{
		if(grupo != null){
		 	return aumento
		}else {
		 	return 0
		}
	}
	
	method laInterpretaBien(cancion)
	{
		return cancion.duracion() > 300
	}
	
	override method habilidad()
	{
		return habilidad + self.puntajePorGrupo()
	}
		
	override method laInterpretaBienEspecifico(cancion)
	{
		return self.laInterpretaBien(cancion) or self.esDeSuAutoria(cancion) 
	}
	
	method cobra(presentacion)
	{
		if (presentacion.tocaSolo(self)){
			return 100
		}else {
			return 50
		}
	}
}

class VocalistaPopular inherits Musico {
	
	const palabra
		
	constructor(_palabra,_habilidad,_albumes,_grupo)= super(_habilidad,_albumes,_grupo)	
	{
	 	palabra = _palabra
	}
	
	method palabra()
	{
		return palabra
	}	
	
	method puntajePorGrupo()
	{
		if(grupo != null){
		 	return 20
		}else {
		 	return 0
		}
	}
	
	method laInterpretaBien(cancion)
	{
		return cancion.contienePalabra(palabra)
	}
	
	override method habilidad()
	{
		return habilidad - self.puntajePorGrupo()
	}
			
	override method laInterpretaBienEspecifico(cancion)
	{
		return self.laInterpretaBien(cancion) or self.esDeSuAutoria(cancion)
	}
	
	method cobra(presentacion)
	{
		if(presentacion.esConcurrido())
		{
			return 500
		}
		else
		{
			return 400
		}
	}
}


object luisAlberto inherits Musico(8,#{justCrisantemo,paraLosArboles},null){
	
	var guitarra = fender
	var justCrisantemo
	var paraLosArboles
	
	override method habilidad(){
		
		return 100.min(habilidad * guitarra.valor())
	}
		
	method cambiarGuitarra(nuevaGuitarra)
	{
		guitarra = nuevaGuitarra
	}
	
	method maltratarGuitarra()
	{
		guitarra.rota()
	}
	
	method laInterpretaBien(cancion)
	{
		return true
	}
	
	override method laInterpretaBienEspecifico(cancion)
	{
		return self.laInterpretaBien(cancion)
	}
	
	method cobra(presentacion)
	{
		if(presentacion.fecha() <= new Date(30, 9, 2017))
		{
			return 1000
		}
		else
		{
			return 1200
		}
	}	
	
	override method cobraEspecifico(presentacion)
	{
		return self.cobra(presentacion)
	}	
}
	