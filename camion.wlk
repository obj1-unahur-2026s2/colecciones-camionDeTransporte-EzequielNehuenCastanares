import cosas.*
object camion {
    const cosas = []

    method cargarUnaCosa(unaCosa){
        cosas.add(unaCosa)
    }

    method descargarUnaCosa(unaCosa){
        cosas.remove(unaCosa)
    }

    method peso(){
        return 1000 + cosas.sum({c => c.peso()})
    }

    method losPesosSonPares(){
        return cosas.all({c => c.peso()%2==0})
    }

    method algunaCosaPesa_(valor){
        return cosas.any({c => c.peso() == valor})
    }

    method cosasQueTienenUnNivelDePeligrosidadMayorA(valor){
        return cosas.filter({c => c.peligrosidad() > valor})
    }

    method cosasQueSuperanNivelDePeligrosidadDe(unaCosa){
        return cosas.filter({c => c.peligrosidad() > unaCosa.peligrosidad()})
    }

    method estaExcedidoDelPesoMaximo(){
        return self.peso() > 2500
    } 

    method algunaCosaSuperaElSiguienteNivelDePeligrosidad(nivelPeligrosidad){
        return cosas.any({c => c.peligrosidad() > nivelPeligrosidad})
    }

    method puedeCircularEnRuta(nivelPeligrosidad){
        return !self.estaExcedidoDelPesoMaximo() && !self.algunaCosaSuperaElSiguienteNivelDePeligrosidad(nivelPeligrosidad)
    }

    method tieneCosaQuePesaEntre_Y_(min, max) = cosas.any({ c => c.peso() > min && c.peso() < max})

    method cosaMasPesada() = cosas.max({c => c.peso()})

}