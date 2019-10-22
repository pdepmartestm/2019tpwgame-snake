import Elemento.*
import wollok.game.*
import Comestibles.*
import Snake.*
import Marco.*
import Pesos.*


object pantallaPrincipal inherits ElementoVisual(image="fondoPrincipal.png",position=game.at(0,0)){
	
	method iniciarPantalla(){
		game.title("Snake Game")
		game.height(12)
		game.width(12)
		self.dibujarElemento()
		keyboard.enter().onPressDo{self.borrarElemento() menu.iniciarMenu()}
	}
	
}

object menu inherits ElementoVisual(image="menu.png",position=game.at(0,0)){
	method iniciarMenu(){
		self.dibujarElemento()
		keyboard.num1().onPressDo{game.clear() nivelUno.informarObjetivo()}
		keyboard.num2().onPressDo{game.clear() nivelDos.informarObjetivo()}
		keyboard.num3().onPressDo{game.clear() nivelTres.informarObjetivo()}
		keyboard.num4().onPressDo{game.clear() controles.iniciarPantalla()}
	}
}

object nivelUno inherits ElementoVisual(image="objetivoNivelUno.png",position=game.at(0,0)){ 
	
	/*Objetivo mantener el peso entre 15 y 20 comiendo cada 10 segundos y haciendo gimnasia cada 15 */
	
	method informarObjetivo(){
		image = "objetivoNivelUno.png"
		self.dibujarElemento()
		game.onTick(10000,"quitarObjetivo1", {self.borrarElemento() image="fondoVerde.jpg" self.iniciarNivelUno()})
	}
	
	method iniciarNivelUno(){
		
		game.removeTickEvent("quitarObjetivo1")
		
		self.dibujarElemento()
		
		marco.crearMarco(0,0,12,12)
		marco.dibujarMarco()
		
		hamburguesa.dibujarElemento()
		manzana.dibujarElemento()
		mancuerna.dibujarElemento()
		
		cabeza.inicializarSnake(self)
		cabeza.dibujarElemento()
		cabeza.engordar(1)
		cabeza.estado("sobria")
		palabraPeso.dibujarElemento()
		peso.informarPeso(1)
		
		var canMove = true
		var tickSpeed = 600 //velocidad a la que se mueve la serpiente
		var duracionNivel = 60000
		
		if (canMove)
		{
			game.onTick(duracionNivel,"duracion de nivel",{game.removeTickEvent("cancionFondo") self.finalizarNivel() self.cumpleCondicion()})
			game.onTick(3000,"cancionFondo",{game.sound("sonidoFondo.mp3")})
			
			keyboard.up().onPressDo { game.removeTickEvent("movimiento") cabeza.mirarA("up") cabeza.mover() game.onTick(tickSpeed,"movimiento",{ cabeza.mover() }) }
			keyboard.down().onPressDo {game.removeTickEvent("movimiento") cabeza.mirarA("down") cabeza.mover() game.onTick(tickSpeed,"movimiento",{ cabeza.mover() }) }
			keyboard.left().onPressDo {game.removeTickEvent("movimiento") cabeza.mirarA("left") cabeza.mover() game.onTick(tickSpeed,"movimiento",{ cabeza.mover() })  }
			keyboard.right().onPressDo {game.removeTickEvent("movimiento") cabeza.mirarA("right") cabeza.mover() game.onTick(tickSpeed,"movimiento",{ cabeza.mover() })  }
			
			game.onTick(tickSpeed,"movimiento",{ cabeza.mover() })
			game.whenCollideDo(cabeza, { elemento => elemento.interactuar(cabeza)})	
			game.whenCollideDo(hamburguesa, { elemento => hamburguesa.reposicionar()})
			game.whenCollideDo(manzana, { elemento => manzana.reposicionar()})
			game.whenCollideDo(mancuerna, { elemento => mancuerna.reposicionar()})
			
			game.onTick(10000,"verSiAlmorzo",{ cabeza.dejeDeComer() })
			game.onTick(15000,"verSiHizoGimnasia",{ cabeza.snakeVaga() })
		}
	}
	
	method cumpleCondicion(){
		if(cabeza.peso()>15 && cabeza.peso()<20 ){
			ganaste.iniciarPantalla()
		}
		else{
			perdiste.iniciarPantalla()
		}
	}
	
	method finalizarNivel(){
		game.clear()
	}
}

object nivelDos inherits ElementoVisual(image="objetivoNivelDos.png",position=game.at(0,0)){ 
	
	/*Objetivo mantener el peso entre 40 y 50 comiendo cada 10 segundos y haciendo gimnasia cada 15*/
	
	method informarObjetivo(){
		image = "objetivoNivelDos.png"
		self.dibujarElemento()
		game.onTick(10000,"quitarObjetivo2", {self.borrarElemento() image="fondoVerde.jpg" self.iniciarNivelDos()})
	}
	
	method iniciarNivelDos(){
		
		game.removeTickEvent("quitarObjetivo2")
		
		self.dibujarElemento()
		
		marco.crearMarco(0,0,12,12)
		marco.dibujarMarco()
		
		hamburguesa.dibujarElemento()
		manzana.dibujarElemento()
		mancuerna.dibujarElemento()
		cerveza.dibujarElemento()
		agua.dibujarElemento()
		
		cabeza.inicializarSnake(self)
		cabeza.dibujarElemento()
		cabeza.engordar(1)
		cabeza.estado("sobria")
		palabraPeso.dibujarElemento()
		peso.informarPeso(1)
		
		var canMove = true
		var tickSpeed = 300 //velocidad a la que se mueve la serpiente
		var duracionNivel = 60000
		
		if (canMove)
		{
			game.onTick(duracionNivel,"duracion de nivel",{game.removeTickEvent("cancionFondo") self.finalizarNivel() self.cumpleCondicion()})
			game.onTick(3000,"cancionFondo",{game.sound("sonidoFondo.mp3")})
			keyboard.up().onPressDo { game.removeTickEvent("movimiento") cabeza.mirarA("up") cabeza.mover() game.onTick(tickSpeed,"movimiento",{ cabeza.mover() }) }
			keyboard.down().onPressDo {game.removeTickEvent("movimiento") cabeza.mirarA("down") cabeza.mover() game.onTick(tickSpeed,"movimiento",{ cabeza.mover() }) }
			keyboard.left().onPressDo {game.removeTickEvent("movimiento") cabeza.mirarA("left") cabeza.mover() game.onTick(tickSpeed,"movimiento",{ cabeza.mover() })  }
			keyboard.right().onPressDo {game.removeTickEvent("movimiento") cabeza.mirarA("right") cabeza.mover() game.onTick(tickSpeed,"movimiento",{ cabeza.mover() })  }
			
			game.onTick(tickSpeed,"movimiento",{ cabeza.mover() })
			game.whenCollideDo(cabeza, { elemento => elemento.interactuar(cabeza)})	
			game.whenCollideDo(hamburguesa, { elemento => hamburguesa.reposicionar()})
			game.whenCollideDo(manzana, { elemento => manzana.reposicionar()})
			game.whenCollideDo(mancuerna, { elemento => mancuerna.reposicionar()})
			game.whenCollideDo(cerveza, { elemento => cerveza.reposicionar()})
			game.whenCollideDo(agua, { elemento => agua.reposicionar()})
			
			game.onTick(10000,"verSiAlmorzo",{ cabeza.dejeDeComer() })
			game.onTick(15000,"verSiHizoGimnasia",{ cabeza.snakeVaga() })
		}
	}
	
	method cumpleCondicion(){
		if(cabeza.peso()>40 && cabeza.peso()<50 ){
			ganaste.iniciarPantalla()
		}
		else{
			perdiste.iniciarPantalla()
		}
	}
	
	method finalizarNivel(){
		game.clear()
	}
}


object nivelTres inherits ElementoVisual(image="objetivoNivelTres.png",position=game.at(0,0)){ 
	
	/*Objetivo mantener el peso entre 16 y 26 comiendo cada 10 segundos y haciendo gimnasia cada 15 */
	
	method informarObjetivo(){
		image = "objetivoNivelTres.png"
		self.dibujarElemento()
		game.onTick(10000,"quitarObjetivo3", {self.borrarElemento() image="fondoVerde.jpg" self.iniciarNivelTres()})
	}
	
	method iniciarNivelTres(){
		
		game.removeTickEvent("quitarObjetivo3")
			
		self.dibujarElemento()
		
		marco.crearMarco(0,0,12,12)
		marco.dibujarMarco()
		
		hamburguesa.dibujarElemento()
		manzana.dibujarElemento()
		mancuerna.dibujarElemento()
		
		cabeza.inicializarSnake(self)
		cabeza.dibujarElemento()
		cabeza.engordar(1)
		cabeza.estado("mareada")
		palabraPeso.dibujarElemento()
		peso.informarPeso(1)
		
		var canMove = true
		var tickSpeed = 450 //velocidad a la que se mueve la serpiente
		var duracionNivel = 60000
		
		if (canMove)
		{
			game.onTick(duracionNivel,"duracion de nivel",{game.removeTickEvent("cancionFondo") self.finalizarNivel() self.cumpleCondicion()})
			game.onTick(3000,"cancionFondo",{game.sound("sonidoFondo.mp3")})
			keyboard.up().onPressDo { game.removeTickEvent("movimiento") cabeza.mirarA("up") cabeza.mover() game.onTick(tickSpeed,"movimiento",{ cabeza.mover() }) }
			keyboard.down().onPressDo {game.removeTickEvent("movimiento") cabeza.mirarA("down") cabeza.mover() game.onTick(tickSpeed,"movimiento",{ cabeza.mover() }) }
			keyboard.left().onPressDo {game.removeTickEvent("movimiento") cabeza.mirarA("left") cabeza.mover() game.onTick(tickSpeed,"movimiento",{ cabeza.mover() })  }
			keyboard.right().onPressDo {game.removeTickEvent("movimiento") cabeza.mirarA("right") cabeza.mover() game.onTick(tickSpeed,"movimiento",{ cabeza.mover() })  }
			
			game.onTick(tickSpeed,"movimiento",{ cabeza.mover() })
			game.whenCollideDo(cabeza, { elemento => elemento.interactuar(cabeza)})	
			game.whenCollideDo(hamburguesa, { elemento => hamburguesa.reposicionar()})
			game.whenCollideDo(manzana, { elemento => manzana.reposicionar()})
			game.whenCollideDo(mancuerna, { elemento => mancuerna.reposicionar()})
			
			game.onTick(10000,"verSiAlmorzo",{ cabeza.dejeDeComer() })
			game.onTick(15000,"verSiHizoGimnasia",{ cabeza.snakeVaga() })
		}
	}
	
	method cumpleCondicion(){
		if(cabeza.peso()>16 && cabeza.peso()<26 ){
			ganaste.iniciarPantalla()
		}
		else{
			perdiste.iniciarPantalla()
		}
	}
	
	method finalizarNivel(){
		game.clear()
	}
}

object controles inherits ElementoVisual(image="controles.png",position=game.at(0,0)){
	method iniciarPantalla(){
		self.dibujarElemento()
		keyboard.r().onPressDo{game.clear() menu.iniciarMenu()}
	}
}

object perdiste inherits ElementoVisual(image="perdiste.png",position=game.at(0,0)){
	method iniciarPantalla(){
		self.dibujarElemento()
		keyboard.r().onPressDo{game.clear() menu.iniciarMenu()}
		keyboard.s().onPressDo{game.clear() game.stop()}
		game.sound("boooo.mp3")
	}
}

object ganaste inherits ElementoVisual(image="ganaste.PNG",position= game.at(0,0)){
	method iniciarPantalla(){
		self.dibujarElemento()
		keyboard.r().onPressDo{game.clear() menu.iniciarMenu()}
		keyboard.s().onPressDo{game.clear() game.stop()}
		game.sound("win.mp3")
	}
}