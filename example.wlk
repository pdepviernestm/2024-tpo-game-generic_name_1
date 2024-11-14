class ObjetoJuego {
    var position
    var property image

    method position() = position
    method position(newPos) {
        position = newPos
    }
    method image() = image
    method image(newImage) {
        image = newImage
    }
}
class EntidadesVivas inherits ObjetoJuego{
  var property vida = 0 
  var rango_X = 4
  var rango_Y = 4
  var ajuste_X=0
  var ajuste_Y=0
  method colisionaCon(otraEntidad) {
        return (otraEntidad.position().x() >= position.x() - rango_X && otraEntidad.position().x() <= position.x() + rango_X) &&
               (otraEntidad.position().y() >= position.y() - rango_Y && otraEntidad.position().y() <= position.y() + rango_Y)
    }
}
class Nave inherits EntidadesVivas {
  var property municionesDisponibles = 12

  method gastarMunicion(){municionesDisponibles-=1}

  method disparar() {
    if(municionesDisponibles>0 && vida==2){
      self.gastarMunicion() 
      return new Bala(position= position.right(4))
      }
      else return
    if(municionesDisponibles>0){
      self.gastarMunicion() 
      return new Bala(position= position.right(3))
      }
      else return 
    

    }

  method sumarMunicion(municionNueva){
    municionesDisponibles += municionNueva
  }
  method perderVida() {
        vida = vida - 1
        image = "nave.png"
    }
  method ponerEscudo(){
      vida=2
      image="escudo_activado.png"

    }

}
class Bala inherits ObjetoJuego(image = "bala.png"){
}

class Meteorito inherits EntidadesVivas(image = "meteorito.png",rango_X=5,rango_Y=5) {
  var velocidad = 0
  method recibirDisparo() {
    vida = vida - 1
  }
  method mover() {
    position = position.down(velocidad)
  }
  
}



class Nivel inherits ObjetoJuego(image= "fondo.jpg", position=game.at(9, 0)) {
    var  nivel = 1
    var property meteoritosEliminados = 0
    var property tiempoRestante = 0
    var meteoritosParaEliminacion = 10
    var property velocidadMeteoritos = 2
    var property balas_disponibles = 2*meteoritosParaEliminacion
    var property contadorMunicion = 0
    var property contadorEscudo = 0
    var property contadorVelocidad = 0
    method incrementarNivel() {
        nivel += 1
        meteoritosEliminados = 0
        meteoritosParaEliminacion += 5
        velocidadMeteoritos += 0.5
        return nivel
    }

    

    method eliminarMeteorito() {
        meteoritosEliminados += 1
        contadorMunicion += 1
        contadorEscudo += 1
        contadorVelocidad += 1
        if (self.meteoritosRestantes() == 0) {
            self.incrementarNivel()
            image= fondo.cambiarFondo(self.nivelActual())
            }
    }


    method nivelActual() = nivel
    method meteoritosRestantes() = meteoritosParaEliminacion - meteoritosEliminados
    method generarMeteoritoDuro() = nivel >= 3
    method generarMeteoritoVeloz() = nivel >= 4

    method iniciar_nave(){
      const nave = new Nave(vida=1,position=game.at(30,6),image="nave.png",rango_X=3,rango_Y=3,ajuste_X=2,ajuste_Y=1,municionesDisponibles=balas_disponibles)
      return nave
    }

    method reducirVelocidad(duracion) {
      tiempoRestante = duracion
      velocidadMeteoritos -= 2
      
    }
    method reducirTiempo(tiempo){
    tiempoRestante-=tiempo
  }

    method aumentarVelocidad(aumento){
      velocidadMeteoritos += aumento
    }


method crearMeteorito(tipo) {
        const x = fondo.limite_izquierdo().randomUpTo(fondo.limite_derecho()).truncate(0)
        const y = 75
        var velocidadExtra = 0
        var vida = 1
         var imagen = tipo + ".png"

        if (tipo == "duro") {
            vida = 2
        } else if (tipo == "veloz") {
            velocidadExtra = 2
        }
        const meteorito = new Meteorito(position = game.at(x, y), velocidad = self.velocidadMeteoritos() + velocidadExtra, vida = vida, image = imagen)
        return meteorito
    }
    


}
object fondo{
    var property image ="fondo.jpg"
    method limite_derecho() = 99
    method limite_izquierdo() = 9
    method limite_arriba() = 80
    method limite_abajo() = 0
  method cambiarFondo(nivel) {
    if (nivel >= 2 && nivel <= 5) {
        self.image("fondo-nivel-" + nivel + ".jpg")
        return self.image()
    }else return 1
    }}
object sumar_minicion {
  var property position = game.at(120, 51)
  var property image = "municion_sinMunicion.png" 
  const property balas_a_agregar = 10

  method cambiarFondo(fondo){
    image = fondo
  }
}
object poner_Escudo{
  var property position = game.at(120,29)
  var property image = "icono_escudo_no_disponible.png"  
  method cambiarFondo(fondo){
    image = fondo
  }
}

object reducir_velocidad{
  var property position = game.at(120, 8)
  var property image = "ralentizacion_desactivada.png" 
  
  method cambiarFondo(fondo){
    image = fondo
  }


  
}








