import Marcas.*
import Personas.*


class Carpas{
	var property limite
	var property marca
	var property tieneMusicaTradicional
	const property personasIngresadas=[]
	const property jarrasVendidas=[]
	
		
  method dejaIngresar(unaPersona)= personasIngresadas.size() < self.limite() and not unaPersona.estaEbria()
	                                 
  method puedeEntrar(unaPersona)= unaPersona.quiereEntrarA(self) and self.dejaIngresar(unaPersona)
	                         
  method ingresarPersona(unaPersona){
  	     if (self.puedeEntrar(unaPersona)) 
  	       personasIngresadas.add(unaPersona)
  	     throw new Exception(message="No se puede ingresar persona")}
 
  
  method servirJarra(unaPersona,capacidad){
  	  if (personasIngresadas.contains(unaPersona)){
  	  	 const jarraServida = new Jarra()
  	  	 jarraServida.capacidad(capacidad)
  	  	 jarraServida.marca(self.marca())
  	  	 jarrasVendidas.add(jarraServida) 
  	  	 unaPersona.comprarJarra(jarraServida)	 
  	 } else {throw new Exception(message="La persona no está ingresada en la carpa")}
 }

  method cantEbriosEmpedernidos()= personasIngresadas.count({p => p.esEbrioEmpedernido()})

}	
