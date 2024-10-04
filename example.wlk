object nave {
  var vida = 1
  var position = game.at(40,2)

  method position() = position

  method position(newPos) {
    position = newPos
  }

  method image() = "nave.jpg"

  method disparar(){
    
  }
}

class Bala{

  method image() = "bala.jpg"

  var position = nave.position()

  method position() = position
  method position(newPos) {
    position = newPos
  }
  method recorrido(){

  
  }
}
