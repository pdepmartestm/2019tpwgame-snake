import Elemento.*
import wollok.game.*

object peso {
	var numeros = ["cero.png","uno.png","dos.png","tres.png","cuatro.png","cinco.png","seis.png","siete.png","ocho.png","nueve.png"]
	
	method informarPeso(numero){
		var unidad = numero % 10
		var decena = numero.div(10)
		self.dibujarNumero( self.obtenerNombreDeNumero(unidad) , "unidad")
		self.dibujarNumero( self.obtenerNombreDeNumero(decena) , "decena")
	}
	
	method dibujarNumero(nombreNumero,parteDeNumero){
		if(parteDeNumero == "unidad"){
			var nuevoNumero = new ElementoVisual(image=nombreNumero, position=game.at(7,11))
			nuevoNumero.dibujarElemento()
		}
		else{
			var nuevoNumero = new ElementoVisual(image=nombreNumero, position=game.at(6,11))
			nuevoNumero.dibujarElemento()
		}
	}
	
	method obtenerNombreDeNumero(numero){
		return numeros.get(numero)
	}
}

const palabraPeso = new ElementoVisual(image="peso.png",position=game.at(4,11))
