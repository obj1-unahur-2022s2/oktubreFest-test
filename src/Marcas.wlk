

class Marca{
	var property cantLupulo
	var property origen
	
}


class CervezaRubia inherits Marca{
	var property graduacion
}

class CervezaNegra inherits Marca{
	
	  method graduacion()=(mundoCervezaNegra.graduacionReglamentaria()).min(cantLupulo*2)	
	
}

class CervezaRoja inherits CervezaNegra{
	
	override method graduacion()= super()*1.25
	 	
}

 
class Jarra{
	var property capacidad
	var property marca
    var property enCarpa
  
  
  method nivelAlcohol()= capacidad*(marca.graduacion()/100)
  
}


object mundoCervezaNegra {
	var property graduacionReglamentaria=10
}
