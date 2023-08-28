package com.confiedy.app.dto;

import com.confiedy.app.entities.Usuario;
import jakarta.validation.constraints.Size;

import java.io.Serializable;

/**
 * DTO for {@link Usuario}
 */
public class CursoDto implements Serializable {
    private Integer id;
    @Size(max = 45)
    private String codigoCurso;
    @Size(max = 45)
    private String nombreCurso;
    @Size(max = 145)
    private String ciclo;
    @Size(max = 145)
    private String nombreDocente;
    @Size(max = 145)
    private String apellidosDocente;
    public CursoDto() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCodigoCurso() {
        return codigoCurso;
    }

    public void setCodigoCurso(String codigoCurso) {
        this.codigoCurso = codigoCurso;
    }

    public String getNombreCurso() {
        return nombreCurso;
    }

    public void setNombreCurso(String nombreCurso) {
        this.nombreCurso = nombreCurso;
    }

    public String getCiclo() {
        return ciclo;
    }

    public void setCiclo(String ciclo) {
        this.ciclo = ciclo;
    }

    public String getNombreDocente() {
        return nombreDocente;
    }

    public void setNombreDocente(String nombreDocente) {
        this.nombreDocente = nombreDocente;
    }

    public String getApellidosDocente() {
        return apellidosDocente;
    }

    public void setApellidosDocente(String apellidosDocente) {
        this.apellidosDocente = apellidosDocente;
    }
}