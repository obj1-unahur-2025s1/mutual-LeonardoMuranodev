class Actividad {
  const property idiomas = []

  method esInteresante() = self.idiomas().size() > 1
  method idiomas() = idiomas
  method cuantosDiasLleva()
  method implicaEsfuerzo()
  method sirveParaBroncearse()
  method esRecomendadaPara(unSocio) = self.esInteresante() && unSocio.leAtrae(self) && unSocio.noRealizo(self)
}


class ViajeDePlaya inherits Actividad {
  const largoDePlaya

  override method cuantosDiasLleva() = (largoDePlaya / 500).roundUp()
  override method implicaEsfuerzo() = largoDePlaya > 1200
  override method sirveParaBroncearse() = true
}

class ExcursionEnLaCiudad inherits Actividad {
  const cantAtracciones

  override method cuantosDiasLleva() = cantAtracciones.div(2)
  override method implicaEsfuerzo() = cantAtracciones.between(5, 8)
  override method sirveParaBroncearse() = false
  override method esInteresante() = super() || cantAtracciones == 5
}

class ExcursionACiudadTropical inherits ExcursionEnLaCiudad {
  override method cuantosDiasLleva() = super() + 1
  override method sirveParaBroncearse() = true
}

class SalidaDeTrekking inherits Actividad {
  const cantKilometros
  const cantDiasDeSol

  override method cuantosDiasLleva() = cantKilometros / 50
  override method implicaEsfuerzo() = cantKilometros > 80
  override method sirveParaBroncearse() = cantDiasDeSol > 200 || (cantDiasDeSol.between(100, 200) && cantKilometros > 120)
  override method esInteresante() = super() && cantDiasDeSol > 140
}

class ClaseDeGimnasia inherits Actividad{
  override method idiomas() = ["español"]
  override method cuantosDiasLleva() = 1
  override method implicaEsfuerzo() = true
  override method sirveParaBroncearse() = false
  override method esRecomendadaPara(unSocio) = unSocio.edad().between(20, 30)
}

class TallerLiterario inherits Actividad {
  const libros = []

  override method idiomas() = libros.map({l => l.idioma()}).asSet()
  override method cuantosDiasLleva() = libros.size() + 1
  method implicaEsfuerzoUnLibro() = libros.any({l => l.implicaEsfuerzo()})
  method sonTodosDelMismoAutor() = libros.all({l => l.autor() == libros.first().autor()})
  override method implicaEsfuerzo() = self.implicaEsfuerzoUnLibro() || (libros.size() > 1 && self.sonTodosDelMismoAutor())
  override method sirveParaBroncearse() = false
  override method esRecomendadaPara(unSocio) = unSocio.cantIdiomas() > 1
}

class Libro {
  const property idioma
  const property autor
  const property cantPaginas

  method implicaEsfuerzo() = cantPaginas > 500
}
