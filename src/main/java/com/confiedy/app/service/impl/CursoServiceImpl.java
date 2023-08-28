package com.confiedy.app.service.impl;

import com.confiedy.app.dto.CursoDto;
import com.confiedy.app.entities.Curso;
import com.confiedy.app.repository.CursoRepository;
import com.confiedy.app.service.CursoService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CursoServiceImpl implements CursoService {
    private final CursoRepository cursoRepository;
    private final ModelMapper mapper;
    @Autowired
    public CursoServiceImpl(final CursoRepository cursoRepository,
                            final ModelMapper mapper) {
        this.cursoRepository = cursoRepository;
        this.mapper = mapper;
    }

    @Override
    public List<CursoDto> getCursosByAlumno(Integer alumnoId) {
        List<Curso> cursos = cursoRepository.getCursosByAlumnoId(alumnoId);
        return cursos.stream().map(x ->mapper.map(x,CursoDto.class)).collect(Collectors.toList());
    }
}
