import materias.*

class Carrera{
	var property materias
}



class Estudiante{
	var property materiasInscriptas
	var property materiasAprobadas
	var property carreras
	var property creditosTotales
	var property anioCursada
	var property materiasEnEspera
		
	method puedeCursar(materia){
		return carreras.any{carrera=>carrera.materias().contains(materia)} && 
		not materiasAprobadas.contains(materia) && 
		not materiasInscriptas.contains(materia) && materia.cumpleRequisito(self)
    }
    
    method aprobo(materia){
    	if(not materiasAprobadas.contains(materia)){
    	 	 materiasAprobadas.add(materia)
    		 materiasInscriptas.remove(materia)
    		 creditosTotales + materia.creditosOtorga()
    	}
    }

}
