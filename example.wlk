object nave {
  var  property vida = 1
  var position = game.at(40,2)
  var property municionesDisponibles = 12
  var property image = "nave.png"
  method position() = position
  method gastarMunicion(){municionesDisponibles-=1}
  method position(newPos) {
    position = newPos
  }
  method colisionaCon(meteorito) {
        const rango_X = 4
        const rango_Y = 4 // Ajusta este valor según el tamaño deseado de la hitbox
        return (meteorito.position().x() >= position.x() - rango_X && meteorito.position().x() <= position.x() + rango_X+3) &&
               (meteorito.position().y() >= position.y() - rango_Y && meteorito.position().y() <= position.y() + rango_Y+2)
    }


  method disparar() {
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
        if (vida <= 0) {
            game.stop()
            
            
        }
    }
    method ponerEscudo(){
      vida=2
      image="escudo_activado.png"

    }
    method cambiarFondo(fondo){
    image = fondo
  }

}
class Bala{

  method image() = "bala.png"

  var position = 0

  method position() = position

  method position(newPos) {
    position = newPos
  }

}

class Meteorito {
  var vida = 1
  var position
  var property image = "meteorito.png"
  var velocidad = 0
  method vida()= vida

  method position() = position

  method position(newPos) {
    position = newPos
  }

  method colisionaCon(bala) {
    const rango = 5 // Uso esto para añadirle "hitbox" a los meteoritos y que no se limite solo a la celda base
    return (bala.position().x() >= position.x() - rango && bala.position().x() <= position.x() + rango) &&
           (bala.position().y() >= position.y() - rango && bala.position().y() <= position.y() + rango)
  }

  method recibirDisparo() {
    vida = vida - 1
  }
  method mover() {
    position = position.down(velocidad)
  }
  
}



class Nivel {
    var nivel = 1
    var property meteoritosEliminados = 0
    var meteoritosParaEliminacion = 10
    var velocidadMeteoritos = 1
    var property balas_disponibles = 2*meteoritosParaEliminacion

    method velocidadMeteoritos() = velocidadMeteoritos
    method incrementarNivel() {
        nivel += 1
        meteoritosEliminados = 0
        meteoritosParaEliminacion += 5
        velocidadMeteoritos += 1
    }

    

    method eliminarMeteorito() {
        meteoritosEliminados += 1
        if (self.meteoritosRestantes() == 0) {
            self.incrementarNivel()
            self.cambiarFondo()
            }
    }


    method nivelActual() = nivel
    method meteoritosRestantes() = meteoritosParaEliminacion - meteoritosEliminados
    method generarMeteoritoDuro() = nivel >= 3
    method generarMeteoritoVeloz() = nivel >= 4

    method iniciar_nave(){
      nave.municionesDisponibles(balas_disponibles)
    }

    //FONDO
    var position = game.at(35, 0)

    method limite_derecho() = 125
    method limite_izquierdo() = 35
    method limite_arriba() = 75
    method limite_abajo() = 0


    method position() = position

    var property image = "fondo.jpg" 

    method cambiarFondo(){
      if(nivel ==2 ){
        self.image("fondo-nivel-2.jpg")
      }else if(nivel == 3){
        self.image("fondo-nivel-3.jpg")
      }else if(nivel == 4){
        self.image("fondo-nivel-4.jpg")
      }else if(nivel == 5){
        self.image("fondo-nivel-5.jpg")
      }
    }
}

object sumar_minicion {
  var property position = game.at(145, 50)
  var property image = "municion_sinMunicion.png" 
  const property balas_a_agregar = 10

  method cambiarFondo(fondo){
    image = fondo
  }
}
object poner_Escudo{
  var property position = game.at(145,35)
  var property image = "icono_escudo_no_disponible.png"  
  method cambiarFondo(fondo){
    image = fondo
  }
}
