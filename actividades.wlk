class Viaje {
  const property idiomas = []

  method esInteresante() = idiomas.size() > 1

  method esRecomendadaPara(unSocio) = self.esInteresante() && unSocio.leAtrae(self) && unSocio.noRealizo(self)
}

class ViajeDePlaya inherits Viaje{
  const largoDePlaya

  method cuantosDiasLleva() = largoDePlaya / 500
  method implicaEsfuerzo() = largoDePlaya > 1200
  method sirveParaBroncearse() = true
}

class ExcursionEnLaCiudad inherits Viaje {
  const cantAtracciones

  method cuantosDiasLleva() = cantAtracciones / 2
  method implicaEsfuerzo() = cantAtracciones.between(5, 8)
  method sirveParaBroncearse() = false
  override method esInteresante() = super() || cantAtracciones == 5
}

class ExcursionACiudadTropical inherits ExcursionEnLaCiudad {
  override method cuantosDiasLleva() = super() + 1
  override method sirveParaBroncearse() = true
}

class SalidaDeTrekking inherits Viaje {
  const cantKilometros
  const cantDiasDeSol

  method cuantosDiasLleva() = cantKilometros / 50
  method implicaEsfuerzo() = cantKilometros > 80
  method sirveParaBroncearse() = cantDiasDeSol > 200 || (cantDiasDeSol.between(100, 200) && cantKilometros > 120)
  override method esInteresante() = super() && cantDiasDeSol > 140
}

class ClaseDeGimnasia {
  const property idiomas = ["español"]

  method cuantosDiasLleva() = 1
  method implicaEsfuerzo() = true
  method sirveParaBroncearse() = false
  method esInteresante() = idiomas.size() > 1
  method esRecomendadaPara(unSocio) = unSocio.edad().between(20, 30)
}

class TallerLiterario {
  const libros = []

  method idiomas() = libros.map({l => l.idioma()}).asSet()
  method cuantosDiasLleva() = libros.size() + 1
  method implicaEsfuerzoUnLibro() = libros.any({l => l.implicaEsfuerzo()})
  method sonTodosDelMismoAutor() = libros.all({l => l.autor() == libros.first().autor()})
  method implicaEsfuerzo() = self.implicaEsfuerzoUnLibro() || (libros.size() > 1 && self.sonTodosDelMismoAutor())
  method sireveParaBroncearse() = false
  method esRecomendadaPara(unSocio) = unSocio.cantIdiomas() > 1
}

class Libros {
  const property idioma
  const property autor
  const property cantPaginas

  method implicaEsfuerzo() = cantPaginas > 500
}