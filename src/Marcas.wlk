

class Marca{
	var property cantLupulo
	var property origen
	
	method precioPorLitro()
}


class CervezaRubia inherits Marca{
	var property graduacion
	
	override method precioPorLitro()=80
}

class CervezaNegra inherits Marca{
	
	  method graduacion()=(mundoCervezaNegra.graduacionReglamentaria()).min(cantLupulo*2)	
	  override method precioPorLitro()=100
}

class CervezaRoja inherits CervezaNegra{
	
	override method graduacion()= super()*1.25
	override method precioPorLitro()=100	
}

 
class Jarra{
	var property capacidad
	var property marca
    var property enCarpa
  
  
  method nivelAlcohol()= capacidad*(marca.graduacion()/100)
 // method precioFinalDeJarra()= enCarpa.precioDeVentaPorLitro()*capacidad
  
}


object mundoCervezaNegra {
	var property graduacionReglamentaria=10
	
}
