import materias.*
import estudiante.*

object universidad {
	var property carreras
	var property estudiantes
	
	method inscribirAlumno(estudiante,materia){
		if(estudiante.puedeCursar(materia) && materia.hayCupo()){
	        materia.curso().add(estudiante)
	        estudiante.materiasInscriptas().add(materia)
//		en este if es si no  hay cupo	        
		}else if(estudiante.puedeCursar(materia)){
			materia.listaEspera().add(estudiante)
			estudiante.materiasEnEspera().add(materia)
		}
	
	}
	
	method bajaEstudiante(estudiante,materia){
		if(materia.curso().contains(estudiante) && not materia.listaEspera().isEmpty()){
			materia.curso().remove(estudiante)
			materia.curso().add(materia.listaEspera().first())
		}else if(materia.curso().contains(estudiante)){
			   materia.curso().remove(estudiante)
		}
    }
    
    method estudiantesIncriptosEn(materia){
        return materia.curso()   	
    }
    
    method estudiantesEnListaEspera(materia){
    	return materia.listaEspera()
    }
    
    method materiasPosiblesInscripcion(estudiante,carrera){
    	if(estudiante.carreras().contains(carrera)){
    		carrera.materias().filter{materia=>materia.cumpleRequisito(estudiante)}
    	}
    }
    
    method materiasInscripto(estudiante){
    	return estudiante.materiasInscriptas()
    }
    method materiasEnEspera(estudiante){
    	return estudiante.materiasEnEspera()
    }
    
     
}
