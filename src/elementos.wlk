import plagas.*

class Hogar{
	var nivelDeMugre
	var confort
	
	method nivelDeMugre() = nivelDeMugre
	
	method good() = nivelDeMugre <= confort/2
	
	method ataqueDe(plaga){
		nivelDeMugre += plaga.nivelDeDanio()
		plaga.aumentarPoblacion()
	}
	
}

class Huerta{
	var produccion
	var nivel = 100
	
	method produccion() = produccion
	
	method good() = produccion > nivel
	
	method nivel(n){
		nivel = n
	}
	
	method ataqueDe(plaga){
		produccion -= plaga.nivelDeDanio()*0.1
		produccion -= if (plaga.transmiteEnfermedades()) 10 else 0
		plaga.aumentarPoblacion()
	}
}

class Mascota{
	var nivelDeSalud
	
	method nivelDeSalud() = nivelDeSalud
	
	method good() = nivelDeSalud > 250
	
	method ataqueDe(plaga){
		nivelDeSalud -= if (plaga.transmiteEnfermedades()) plaga.nivelDeDanio() else 0
		plaga.aumentarPoblacion()
	}
}

class Barrio{
	var elementos = []
	
	method esCopado(){
		const goodElements =	elementos.count({ e => e.good() })
		const badElements =	elementos.count({ e => !e.good() })
		return (goodElements > badElements)
	}
	
	method elementos() = elementos
}