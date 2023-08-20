package com.confiedy.app.service;


import com.confiedy.app.dto.ResultPageWrapper;
import com.confiedy.app.dto.UsuarioDto;
import org.springframework.data.domain.Pageable;

public interface UsuarioService {
    UsuarioDto save(UsuarioDto usuarioDto);
    UsuarioDto update(Integer id, UsuarioDto dto);

    UsuarioDto getUserByUserAndPassword(UsuarioDto usuarioDto);
    ResultPageWrapper<UsuarioDto> getAll(Pageable paging);
}
