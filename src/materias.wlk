class Materia{
//entiendo por curso los alumnos que estan anotados en dicha
//materia, por ende curso es un conjuntos de alumnos
//ya que el curso es unico para cada materia	
	var property curso
	var property anio
	var property creditosOtorga
	var property cupo
	var property listaEspera
	
	method hayCupo(){
		return curso.size() < cupo
	}
}

class MateriaConCorrelatividad inherits Materia{
	var property materiasCorrelativas
    method cumpleRequisito(estudiante){
    	return	materiasCorrelativas.difference(estudiante.materiasAprobadas()) == #{}
     
    }
}

class MateriaConCreditos inherits Materia{
	var property creditosNecesarios
	method cumpleRequisito(estudiante){
		return estudiante.creditosTotales() >= creditosNecesarios
	}
}

class MateriaPorAnio inherits Materia{
	method materiasPorAnio(carrera,anio){
		return carrera.materias().filter{materia=>materia.anio() == anio}
	}
	method carreraCorrespA(estudiante){
		return estudiante.carreras().any{carrera=>carrera.contains(self)}
	}
//para que se pueda anotar en una materia de segundo tiene que haber aprobado todas
//las de primero
    method cumpleRequisito(estudiante){
	return	self.materiasPorAnio(self.carreraCorrespA(estudiante),
		estudiante.anioCursada()).difference(estudiante.materiasAprobadas()) == #{} 
	}
	
}

class MateriaSinPrerrequisito inherits Materia{
	method cumpleRequisito(estudiante){
		return true
	}
}