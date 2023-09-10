package com.confiedy.app.repository;

import com.confiedy.app.dto.EvaluacionCursoDto;
import com.confiedy.app.entities.AlumnoEvaluacionCurso;
import com.confiedy.app.entities.Curso;
import com.confiedy.app.entities.EvaluacionCurso;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface EvaluacionCursoRepository extends JpaRepository<AlumnoEvaluacionCurso, Integer> {
    @Query(value = "select ec from AlumnoEvaluacionCurso aec join "+
    "EvaluacionCurso ec on aec.evaluacionCurso = ec.id where ec.curso.id = :cursoId and aec.alumno.id = :alumnoId")
    List<EvaluacionCurso> findEvaluacionCursoByCursoId(Integer cursoId, Integer alumnoId);
}