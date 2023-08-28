package com.confiedy.app.controller;
import com.confiedy.app.dto.CursoDto;
import com.confiedy.app.service.CursoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.logging.Logger;

@RestController
@RequestMapping("/app")
public class CursoController {
    private final CursoService cursoService;
    private static final Logger log = Logger.getLogger(CursoController.class.getName());
    @Autowired
    public CursoController(CursoService cursoService) {
        this.cursoService = cursoService;
    }

    @GetMapping(value="cursos")
    public ResponseEntity<List<CursoDto>> getAll(
            @RequestParam(name = "alumnoId") int alumnoId){
        List<CursoDto> cursoDtos;
        try {
           cursoDtos = cursoService.getCursosByAlumno(alumnoId);
        } catch (Exception e){
            log.info("Excepcion en: "+e.getMessage());
            return new ResponseEntity<>(HttpStatus.OK);
        }
        return new ResponseEntity<>(cursoDtos, HttpStatus.OK);
    }
}
