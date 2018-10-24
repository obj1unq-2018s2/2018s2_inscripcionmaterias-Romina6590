class Materia{
	var property curso
	var property anio
	var property creditosOtorga
}

class MateriaConCorrelatividad inherits Materia{
	var property materiasCorrelativas
    method cumpleRequisito(estudiante){
    	estudiante.materiasAprobadas()
    }
}

class MateriaConCreditos inherits Materia{
	var property creditosNecesarios
}

class MateriaPorAnio inherits Materia{
	
}

class MateriaSinPrerrequisito inherits Materia{
	
}