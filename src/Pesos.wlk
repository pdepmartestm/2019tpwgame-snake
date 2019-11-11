import Elemento.*
import wollok.game.*

object peso {
	var numeros = ["cero.png","uno.png","dos.png","tres.png","cuatro.png","cinco.png","seis.png","siete.png","ocho.png","nueve.png"]
	
	method informarPeso(numero){
		var unidad = numero % 10
		var decena = numero.div(10)
		self.dibujarNumero( self.obtenerNombreDeNumero(unidad) , 7)
		self.dibujarNumero( self.obtenerNombreDeNumero(decena) , 6)
	}
	
	method dibujarNumero(nombreNumero,parteDeNumero){
		var nuevoNumero = new ElementoVisual(image=nombreNumero, position=game.at(parteDeNumero,11))
		nuevoNumero.dibujarElemento()
	}
	
	method obtenerNombreDeNumero(numero){
		return numeros.get(numero)
	}
}
