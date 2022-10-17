import Marcas.*
import Personas.*


class Carpas{
	var property limite
	var property marca
	var property tieneMusicaTradicional
	//var property recargoDeVenta
	const property personasIngresadas=[]
	const property jarrasVendidas=[]
	
		
  method dejaIngresar(unaPersona)= personasIngresadas.size() < self.limite() and not unaPersona.estaEbria()
	                                 
  method puedeEntrar(unaPersona)= unaPersona.quiereEntrarA(self) and self.dejaIngresar(unaPersona)
	                         
  method ingresarPersona(unaPersona){
  	     if (self.puedeEntrar(unaPersona)) 
  	       personasIngresadas.add(unaPersona)
  	     else {throw new Exception(message="No se puede ingresar persona")}
 }
  
  method servirJarra(unaPersona,capacidad){
  	  if (personasIngresadas.contains(unaPersona)){
  	  	 const jarraServida = new Jarra()
  	  	 jarraServida.capacidad(capacidad)
  	  	 jarraServida.marca(self.marca())
  	  	 jarraServida.enCarpa(self)
  	  	 jarrasVendidas.add(jarraServida) 
  	  	 unaPersona.comprarJarra(jarraServida)
  	  	  
  	 } else {throw new Exception(message="La persona no está ingresada en la carpa")}
 }

  method cantEbriosEmpedernidos()= personasIngresadas.count({p => p.esEbrioEmpedernido()})

 ///
  method nacionalidades()=personasIngresadas.map({p => p.nacionalidad()})
  method cantNacionalidades()=self.nacionalidades().size()
  method predominaNacionalidad()=self.nacionalidades().max({nacionalidad=>self.cantNacionalidades()})
  
  
  method esCarpaHomogenea()= personasIngresadas.all({p => p.nacionalidad()== self.predominaNacionalidad()})
  
  method faltaServirA()=personasIngresadas.filter({p => not p.comproJarrasEn().contains(self)})
  
  
 // method precioDeVentaPorLitro()=self.marca().precioPorLitro()+ recargoDeVenta
 
  
}
//object recargoFijo{method porcentaje(_)=30}
//object recargoPorCant{method porcentaje(unaCarpa)= if(unaCarpa.personasIngresadas().size()==unaCarpa.limite()*0.5){40}else{25}}
//object recargoPorEbriedad{ method porcentaje(unaCarpa)= if(unaCarpa.cantEbriosEmpedernidos()>=(unaCarpa.personasIngresadas()*0.75){50}else{20}} 
