import Elemento.*
import wollok.game.*
import Snake.*
import Pesos.*

class Comestible inherits ElementoDinamico{
	method interactuar(cabeza)
	method reposicionar(){
		self.nuevaPosicionAlAzar()
	}
}

object manzana inherits Comestible(image = "manzana.png", position = game.at(3,3)){
	override method interactuar(cabeza){
		cabeza.almorce(true)
		cabeza.engordar(1)
		peso.informarPeso(cabeza.peso())
		game.sound("come.mp3")
		self.nuevaPosicionAlAzar()
	}
}

object hamburguesa inherits Comestible(image = "burguer.png", position = game.at(4,4)) {
	override method interactuar(cabeza){
		cabeza.almorce(true)
		cabeza.engordar(3)
		peso.informarPeso(cabeza.peso())
		game.sound("come.mp3")
		self.nuevaPosicionAlAzar()
	}
}

object mancuerna inherits Comestible(image = "mancuerna.png", position = game.at(7,5)){ 
	override method interactuar(cabeza){
		cabeza.hiceGimnasia(true)
		cabeza.adelgazar(2)
		peso.informarPeso(cabeza.peso())
		game.sound("Tarzan.mp3")
		self.nuevaPosicionAlAzar()
	}

}

object cerveza inherits Comestible(image = "cerveza.png", position = game.at(6,3)){ 
	override method interactuar(cabeza){
		cabeza.estado("mareada")
		game.sound("eructo.mp3")
		self.nuevaPosicionAlAzar()
	}
}

object agua inherits Comestible(image = "botella.png", position = game.at(8,8)){ 
	override method interactuar(cabeza){
		cabeza.estado("sobria")
		game.sound("eructo.mp3")
		self.nuevaPosicionAlAzar()
	}
}