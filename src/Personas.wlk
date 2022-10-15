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
  
  method esPatriota()= jarrasCompradas.all({j => j.marca().origen()==self.nacionalidad()})
  	  
}



 class PersonaBelga inherits Persona{
 	
  override method nacionalidad()="Belgica"
 	
  method leGustaCerveza(unaMarca)= unaMarca.cantLupulo()>4
  method quiereEntrarA(unaCarpa)= self.leGustaCerveza(unaCarpa.marca())
                                  and (self.leGustaMusicaTradicional()== unaCarpa.tieneMusicaTradicional()) 
 }
 
 class PersonaCheca inherits Persona{
 	
 	override method nacionalidad()="Checoslovaquia"
 	method leGustaCerveza(unaMarca)= unaMarca.graduacion()>8
 	method quiereEntrarA(unaCarpa)= self.leGustaCerveza(unaCarpa.marca())
                                  and (self.leGustaMusicaTradicional()== unaCarpa.tieneMusicaTradicional()) 
 }
 
 class PersonaAlemana inherits Persona{
 	
 	 override method nacionalidad()="Alemania"
 	 method leGustaCerveza(unaMarca)= true
 	 method quiereEntrarA(unaCarpa)= self.leGustaCerveza(unaCarpa.marca())
                                  and (self.leGustaMusicaTradicional()== unaCarpa.tieneMusicaTradicional())
                                  and (unaCarpa.personasIngresadas().size()).even()
 }