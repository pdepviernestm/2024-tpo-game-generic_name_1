object nave {
  var vida = 1
  var position = game.at(40,2)

  method position() = position

  method position(newPos) {
    position = newPos
  }
  method colisionaCon(meteorito) {
        const rango = 2 // Ajusta este valor según el tamaño deseado de la hitbox
        return (meteorito.position().x() >= position.x() - rango && meteorito.position().x() <= position.x() + rango) &&
               (meteorito.position().y() >= position.y() - rango && meteorito.position().y() <= position.y() + rango)
    }
  method disparar() = new Bala()

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
  var position

  method image() = "meteorito.png"

  method position() = position

  method position(newPos) {
    position = newPos
  }
  method colisionaCon(bala) {
        const rango = 2 //uso esto para añadirle "hitbox" a los meteoritos y que no se limite solo a la celda base
        return (bala.position().x() >= position.x() - rango && bala.position().x() <= position.x() + rango) &&
               (bala.position().y() >= position.y() - rango && bala.position().y() <= position.y() + rango)
    }
}

//La idea es que ESTE sea el fondo del juego.
object fondo{
  var position = game.at(35, 0)

  method limite_derecho() = 125
  method limite_izquierdo() = 35

  method position() = position

  method image() = "fondo.jpg"
}
