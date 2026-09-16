object knightRider{
    method peso() = 500
    method peligrosidad() = 10
    method sufreLasConsecuencias(){}
    method bultosQueOcupa()=1
}

object bumblebee {
    var transformado = auto

    method transformar(cosa){
        transformado = cosa
    }

    method peligrosidad() = transformado.peligrosidad()

    method peso() = 800

    method sufreLasConsecuencias(){
      self.transformar(robot)
    }

    method bultosQueOcupa()=2
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

    method sufreLasConsecuencias(){
      cantidadDeLadrillos += 12
    }

    method bultosQueOcupa(){
      if(self.hasta100()){
        return 1
      }
      else if(self.entre101Y300()){
        return 2
      }
      else{
        return 3
      }
    }

    method hasta100() = cantidadDeLadrillos <= 100
    method entre101Y300() = cantidadDeLadrillos.between(101, 300)
    method mayorA300() = cantidadDeLadrillos > 300
}

object arenaAGranel {
    var peso = 1

    method peso() = peso

    method cambiarPeso(cantidad){
        peso = cantidad
    } 

    method peligrosidad() = 1

    method sufreLasConsecuencias(){
      peso = (peso-10).max(0)
    }
    method bultosQueOcupa()=1    
}

object bateriaAntiaerea {

  var estaConMisiles = false

  method cambiarMisiles(){
    estaConMisiles = !estaConMisiles
  }

  method peso() = if(estaConMisiles) 300 else 200

  method peligrosidad() = if(estaConMisiles) 100 else 0

  method sufreLasConsecuencias(){
    estaConMisiles = true
  }

  method bultosQueOcupa() = if(estaConMisiles) 2 else 1
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

  method sufreLasConsecuencias(){
    cosas.map({c => c.sufreLasConsecuencias()})
  }

  method bultosQueOcupa(){
    1 + cosas.sum({c => c.bultosQueOcupa()})
  }

  method queCosa()= cosas
}
  

object residuosRadioactivos {
  var peso = 1

  method peso() = peso

  method cambiarPeso(nuevoPeso){
    peso = nuevoPeso
  }

  method peligrosidad() = 200

  method sufreLasConsecuencias(){
    peso += 15
  }
  method bultosQueOcupa()=1
}

object embalajeDeSeguridad {
  var cosaAdentro = residuosRadioactivos

  method cambiarCosaAdentro(unaCosa) {
    cosaAdentro = unaCosa
  }

  method peso() = cosaAdentro.peso()

  method peligrosidad() = cosaAdentro.peligrosidad()/2

  method sufreLasConsecuencias(){}

  method bultosQueOcupa()=2
  
}