package com.confiedy.app.service.impl;

import com.confiedy.app.dto.CursoDto;
import com.confiedy.app.dto.EvaluacionCursoDto;
import com.confiedy.app.entities.AlumnoEvaluacionCurso;
import com.confiedy.app.entities.Curso;
import com.confiedy.app.entities.EvaluacionCurso;
import com.confiedy.app.repository.CursoRepository;
import com.confiedy.app.repository.EvaluacionCursoRepository;
import com.confiedy.app.service.CursoService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CursoServiceImpl implements CursoService {
    private final CursoRepository cursoRepository;
    private final EvaluacionCursoRepository evaluacionCursoRepository;
    private final ModelMapper mapper;
    @Autowired
    public CursoServiceImpl(final CursoRepository cursoRepository,
                            final EvaluacionCursoRepository evaluacionCursoRepository,
                            final ModelMapper mapper) {
        this.cursoRepository = cursoRepository;
        this.evaluacionCursoRepository = evaluacionCursoRepository;
        this.mapper = mapper;
    }

    @Override
    public List<CursoDto> getCursosByAlumno(Integer alumnoId) {
        List<Curso> cursos = cursoRepository.getCursosByAlumnoId(alumnoId);
        return cursos.stream().map(x ->mapper.map(x,CursoDto.class)).collect(Collectors.toList());
    }

    public List<EvaluacionCursoDto> getEvaluacionesByCursoId(Integer cursoId, Integer alumnoId){
        List<EvaluacionCurso> evaluacionCurso = evaluacionCursoRepository.findEvaluacionCursoByCursoId(cursoId,alumnoId);
        return evaluacionCurso.stream().map(x ->mapper.map(x,EvaluacionCursoDto.class)).collect(Collectors.toList());
    }

    @Override
    public List<CursoDto> getCursos() {
        List<Curso> cursos = cursoRepository.findAll();
        return cursos.stream().map(x ->mapper.map(x,CursoDto.class)).collect(Collectors.toList());
    }

}
