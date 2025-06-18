class Viaje {
  const idiomas = []

  method esInteresante() = idiomas.size() > 1
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