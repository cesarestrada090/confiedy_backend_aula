package com.confiedy.app.service.impl;

import com.confiedy.app.entities.Usuario;
import com.confiedy.app.util.MapperUtil;
import com.confiedy.app.util.PaginationUtil;
import com.confiedy.app.dto.ResultPageWrapper;
import com.confiedy.app.dto.UsuarioDto;
import com.confiedy.app.repository.UsuarioRepository;
import com.confiedy.app.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UsuarioServiceImpl implements UsuarioService {

    private final UsuarioRepository usuarioRepository;

    @Autowired
    public UsuarioServiceImpl(UsuarioRepository usuarioRepository) {
        this.usuarioRepository = usuarioRepository;
    }

    @Override
    public UsuarioDto save(UsuarioDto usuarioDto) {
        Usuario usuario = MapperUtil.map(usuarioDto, Usuario.class);
        usuarioRepository.save(usuario);
        return MapperUtil.map(usuario, UsuarioDto.class);
    }
    @Override
    public UsuarioDto update(Integer id, UsuarioDto usuarioDto){
        if(usuarioRepository.findById(id).isPresent()){
            Usuario existingEntity = usuarioRepository.findById(id).get();
            existingEntity.setPassword(usuarioDto.getPassword());
            existingEntity.getAlumno().setNombre(usuarioDto.getNombreAlumno());
            existingEntity.getAlumno().setApellido(usuarioDto.getApellidoAlumno());
            existingEntity.getAlumno().setCarrera(usuarioDto.getCarrera());
            existingEntity.getAlumno().setFechaNacimiento(usuarioDto.getFechaNacimiento());
            usuarioRepository.save(existingEntity);
            return MapperUtil.map(existingEntity, usuarioDto.getClass());
        }
        throw new IllegalArgumentException();
    }

    @Override
    public UsuarioDto getUserByUserAndPassword(UsuarioDto usuarioDto) {
        Optional<Usuario> usuarioOptional = usuarioRepository.
                findUsuarioByUsernameAndPassword(usuarioDto.getUsername(),usuarioDto.getPassword());
        if(usuarioOptional.isPresent()) {
            return MapperUtil.map(usuarioOptional.get(), UsuarioDto.class);
        }
        throw new IllegalArgumentException();
    }

    @Override
    public UsuarioDto getUserById(Integer id){
        Usuario usuario = usuarioRepository.getReferenceById(id);
        UsuarioDto dto = MapperUtil.map(usuario, UsuarioDto.class);
        dto.setCarrera(usuario.getAlumno().getCarrera());
        dto.setFechaNacimiento(usuario.getAlumno().getFechaNacimiento());
        return dto;
    }
    @Override
    public ResultPageWrapper<UsuarioDto> getAll(Pageable paging){
        Page<Usuario> areaPage = usuarioRepository.findAll(paging);
        return PaginationUtil.prepareResultWrapper(areaPage, UsuarioDto.class);
    }
}
