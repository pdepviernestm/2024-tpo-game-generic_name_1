object nave {
  var vida = 1
  var position = game.at(40,2)
 var municion = 20
  method position() = position
  method gastarMunicion(){municion-=1}
  method position(newPos) {
    position = newPos
  }
  method colisionaCon(meteorito) {
        const rango_X = 4
        const rango_Y = 6 // Ajusta este valor según el tamaño deseado de la hitbox
        return (meteorito.position().x() >= position.x() - rango_X && meteorito.position().x() <= position.x() + rango_X+3) &&
               (meteorito.position().y() >= position.y() - rango_Y && meteorito.position().y() <= position.y() + rango_Y+2)
    }
  method disparar() {
  if(municion>0){
    self.gastarMunicion() 
  return new Bala()}
  else return }

  method image() = "nave.png"
  method perderVida() {
        vida = vida - 1
        if (vida <= 0) {
            game.stop()
            
            
        }
    }
}

class Bala{

  method image() = "bala.png"

  var position = nave.position()

  method position() = position

  method position(newPos) {
    position = newPos
  }

}

class Meteorito {
  var vida = 1
  var position
  var property image = "meteorito.png"
  var velocidad = 4
  method vida()= vida

  method position() = position

  method position(newPos) {
    position = newPos
  }

  method colisionaCon(bala) {
    const rango = 6 // Uso esto para añadirle "hitbox" a los meteoritos y que no se limite solo a la celda base
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


//La idea es que ESTE sea el fondo del juego.
object fondo{
  var position = game.at(35, 0)

  method limite_derecho() = 125
  method limite_izquierdo() = 35
  method limite_arriba() = 75
  method limite_abajo() = 0


  method position() = position

  method image() = "fondo.jpg"
}

class Nivel {
    var nivel = 1
    var meteoritosEliminados = 0
    var meteoritosParaEliminacion = 10
    var velocidadMeteoritos = 4


    method incrementarNivel() {
        nivel += 1
        meteoritosEliminados = 0
        meteoritosParaEliminacion += 5
         velocidadMeteoritos += 1
    }

    method verificarProgreso() {
        if (meteoritosEliminados >= meteoritosParaEliminacion) {
            self.incrementarNivel()
        }
    }

    method eliminarMeteorito() {
        meteoritosEliminados += 1
        self.verificarProgreso()
    }

    method nivelActual() = nivel
    method meteoritosRestantes() = meteoritosParaEliminacion - meteoritosEliminados
}