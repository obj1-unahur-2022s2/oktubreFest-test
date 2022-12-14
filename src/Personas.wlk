import Marcas.*
import Carpas.*

class Persona{
	var property peso
	var property nivelDeAguante
	var property leGustaMusicaTradicional
	var property nacionalidad=""
	const property jarrasCompradas=[]
	
	
  method estaEbria(){
	return self.totalAlcoholIngerido()*peso > nivelDeAguante
  }
  
  method totalAlcoholIngerido()=jarrasCompradas.sum({j => j.nivelAlcohol()})
  
  method comprarJarra(unaJarra)=jarrasCompradas.add(unaJarra)

  method esEbrioEmpedernido()= jarrasCompradas.all({j => j.capacidad()>=1 })
  
  method leGustaCerveza(unaMarca)
  method quiereEntrarA(unaCarpa)= self.leGustaCerveza(unaCarpa.marca())
                                  and (self.leGustaMusicaTradicional()== unaCarpa.tieneMusicaTradicional())  
 
  
  method esPatriota()= jarrasCompradas.all({j => j.marca().origen()==self.nacionalidad()})
  method comproJarrasEn()=jarrasCompradas.map({j => j.enCarpa()})
  
  method marcasCompradas()=jarrasCompradas.map({j => j.marca()}).asSet()
  
  
  method coincidenciasCon(persona) = self.marcasCompradas().intersection(persona.marcasCompradas())
  method diferenciasCon(persona) = self.marcasCompradas().difference(persona.marcasCompradas())
  method esCompatibleCon(persona) = self.coincidenciasCon(persona).size() > self.diferenciasCon(persona).size()
  
  method ultimaJarraComprada()=jarrasCompradas.last()
  
  method estaEntrandoEnVicio(){
  	   return jarrasCompradas.all({j => j.capacidad()<= self.ultimaJarraComprada().capacidad()})
  	    }
  
 // method gastoTotalEnCerveza()=jarrasCompradas.sum({j => j.precioFinalDeJarra()})
  
  //method laCervezaMasCara()=jarrasCompradas.max({j => j.precioFinalDeJarra()})
     
  }


 class PersonaBelga inherits Persona{
 	
  override method nacionalidad()="Belgica"
 	
  override method leGustaCerveza(unaMarca)= unaMarca.cantLupulo()>4
 
 }
 
 class PersonaCheca inherits Persona{
 	
 	override method nacionalidad()="Checoslovaquia"
 	override method leGustaCerveza(unaMarca)= unaMarca.graduacion()>8
 	 
 }
 
 class PersonaAlemana inherits Persona{
 	
 	 override method nacionalidad()="Alemania"
 	 override method leGustaCerveza(unaMarca)= true
 	 override method quiereEntrarA(unaCarpa)=super(unaCarpa) and (unaCarpa.personasIngresadas().size()).even()
 }
 
 