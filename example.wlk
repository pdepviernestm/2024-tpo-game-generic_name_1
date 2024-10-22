object nave {
  var vida = 1
  var position = game.at(40,2)

  method position() = position

  method position(newPos) {
    position = newPos
  }

  method disparar() = new Bala()

  method image() = "nave.png"
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

}

//La idea es que ESTE sea el fondo del juego.
object fondo{
  var position = game.at(35, 0)

  method limite_derecho() = 125
  method limite_izquierdo() = 35

  method position() = position

  method image() = "fondo.jpg"
}
