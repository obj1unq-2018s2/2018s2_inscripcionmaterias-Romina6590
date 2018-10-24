import materias.*

class Carrera{
	var property materias
}



class Estudiante{
	var property materiasInscriptas
	var property materiasAprobadas
	var property carreras
	var property creditosTotales
		
	method puedeCursar(materia){
		return carreras.any{carrera=>carrera.contains(materia)} && 
		not materiasAprobadas.contains(materia) && 
		not materiasInscriptas.contains(materia) && materia.cumpleRequisito(self)
    }
    
    method aprobo(materia){
    	if(not materiasAprobadas.contains(materia)){
    		return materiasAprobadas.add(materia)
    	}else{
    		return materiasAprobadas
    	}
    }

}
