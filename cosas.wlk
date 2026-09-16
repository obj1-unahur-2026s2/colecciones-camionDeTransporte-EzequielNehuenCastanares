object knightRider{
    method peso() = 500
    method peligrosidad() = 10
}

object bumblebee {
    var transformado = auto

    method transformar(cosa){
        transformado = cosa
    }

    method peligrosidad() = transformado.peligrosidad()

    method peso() = 800


}

object robot {
    method peligrosidad() = 30
}

object auto {
    method peligrosidad() = 15
}

object paqueteDeLadrillos {
    var cantidadDeLadrillos = 1

    method peso() = cantidadDeLadrillos * 2

    method cantidadDeLadrillos(cantidad){
        cantidadDeLadrillos = cantidad
    }

    method peligrosidad() = 2
}

object arenaAGranel {
    var peso = 1

    method peso() = peso

    method cambiarPeso(cantidad){
        peso = cantidad
    } 

    method peligrosidad() = 1
}

object bateriaAntiaerea {

  var estaConMisiles = false

  method cambiarMisiles(){
    estaConMisiles = !estaConMisiles
  }

  method peso() = if(estaConMisiles) 300 else 200

  method peligrosidad() = if(estaConMisiles) 100 else 0

}

object contenedorPortuario {
  const cosas = []

  method agregarCosa(unaCosa){
    cosas.add(unaCosa)
  }

  method quitarCosa(unaCosa){
    cosas.remove(unaCosa)
  }

  method peso() = 100 + cosas.sum({c => c.peso()})
  

  method peligrosidad() = if(cosas.isEmpty()) 0 else cosas.map({c => c.peligrosidad()}).max()

}
  

object residuosRadioactivos {
  var peso = 1

  method peso() = peso

  method cambiarPeso(nuevoPeso){
    peso = nuevoPeso
  }

  method peligrosidad() = 200
}

object embalajeDeSeguridad {
  var cosaAdentro = residuosRadioactivos

  method cambiarCosaAdentro(unaCosa) {
    cosaAdentro = unaCosa
  }

  method peso() = cosaAdentro.peso()

  method peligrosidad() = cosaAdentro.peligrosidad()/2
  
}