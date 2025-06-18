class Socio {
    const actividades = []
    const maximoActividades
    const property edad
    const idiomas = []

    //Metodos de consulta
    method esAdoradorDelSol() = actividades.all({a =>a.sirveParaBroncearse()})
    method actividadesDeEsfuerzo() = actividades.filter({a => a.implicaEsfuerzo()})
    method noRealizo(unaActividad) = not actividades.contains(unaActividad)
    method cantIdiomas() = idiomas.size()

    //Metodos de indicacion
    method realizarActividad(unaActividad) {
      if(actividades.size() < maximoActividades) {
        actividades.add(unaActividad)
      }
      else {
        self.error("El socio ya ha llegado a su maximo de actividades")
      }
    }
}

class SocioTranquilo inherits Socio {
    method leAtrae(unaActividad) = unaActividad.cuantosDiasLleva() >= 4
}

class SocioCoherente inherits Socio {
    method leAtrae(unaActividad) = if(self.esAdoradorDelSol()) unaActividad.sirveParaBroncearse() else unaActividad.implicaEsfuerzo()
}

class SocioRelajado inherits Socio {
    method leAtrae(unaActividad) = idiomas.any({i => unaActividad.idiomas().contains(i)})
}