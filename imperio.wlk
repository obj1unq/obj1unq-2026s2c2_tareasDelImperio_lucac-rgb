class Tarea{

   method recursosProducidos(tiempo) = 50 * (tiempo - self.desgaste(tiempo)) * self.esfuerzo()

   method desgaste(tiempo)

   method esfuerzo() 

}


class Siembra inherits Tarea {

    var property esfuerzoConfigurable 

    override method desgaste(tiempo) = 1 + self.horasExtras(tiempo)

    method horasExtras(tiempo)

    override method esfuerzo() = esfuerzoConfigurable

}

class SiembraEnElValle inherits Siembra {

    var property esEpocaDeLluvias 

    override method recursosProducidos(tiempo) = if (esEpocaDeLluvias) 0 else  50 * (tiempo - self.desgaste(tiempo)) * self.esfuerzo()

    override method horasExtras(tiempo) = (tiempo - 8).max(0)

}

class SiembraEnLaTerraza inherits Siembra {

    override method recursosProducidos(tiempo)  = 3 * (50 * (tiempo - self.desgaste(tiempo)) * self.esfuerzo())

    override method horasExtras(tiempo) = (tiempo - 6).max(0)

}

class Mensaje inherits Tarea {

    override method esfuerzo() = 1.4

    override method desgaste(tiempo) = tiempo/4

}

class MensajeImperial inherits Mensaje {

    override method esfuerzo() = 1.8

    override method desgaste(tiempo) = ((tiempo/4)-2).max(1)

}
