

class Plaga{
	var poblacion
	
	method poblacion() = poblacion
	
	method transmiteEnfermedades(){return poblacion >= 10}
	
	method aumentarPoblacion(){
		poblacion += poblacion*0.1
	}
}

class Cucarachas inherits Plaga{
	var pesoPromedio
	
	method pesoPromedio() = pesoPromedio
	
	method nivelDeDanio(){return poblacion/2}
	
	override method transmiteEnfermedades(){
		return super() and pesoPromedio >= 10
	}
	
	override method aumentarPoblacion(){
		super()
		pesoPromedio += 2
	}
	
}

class Mosquitos inherits Plaga{
	
	method nivelDeDanio(){return poblacion}
	
	override method transmiteEnfermedades(){
		return super() and (poblacion % 3 == 0)
	}
}

class Pulgas inherits Plaga{
	
	method nivelDeDanio(){return poblacion * 2}
}

class Garrapatas inherits Pulgas{
	
	override method aumentarPoblacion(){
		poblacion += poblacion*0.2
		
	}
}