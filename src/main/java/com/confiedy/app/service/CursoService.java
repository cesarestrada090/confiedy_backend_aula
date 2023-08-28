package com.confiedy.app.service;


import com.confiedy.app.dto.CursoDto;
import com.confiedy.app.dto.ResultPageWrapper;
import com.confiedy.app.dto.UsuarioDto;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CursoService {
    List<CursoDto> getCursosByAlumno(Integer alumnoId);
}
