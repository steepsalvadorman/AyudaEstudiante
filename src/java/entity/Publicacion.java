/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author steve
 */
public class Publicacion {
    private int id;
    private byte[] documento;
    private String publicacion;
    private String descripcion;
    private String tipoCurso;
    private String fechaPublicacion;

    public Publicacion(int id, byte[] documento, String publicacion, String descripcion, String tipoCurso, String fechaPublicacion) {
        this.id = id;
        this.documento = documento;
        this.publicacion = publicacion;
        this.descripcion = descripcion;
        this.tipoCurso = tipoCurso;
        this.fechaPublicacion = fechaPublicacion;
    }

    public Publicacion(byte[] documento, String publicacion, String descripcion, String tipoCurso, String fechaPublicacion) {
        this(0, documento, publicacion, descripcion, tipoCurso, fechaPublicacion);
    }
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public byte[] getDocumento() {
        return documento;
    }

    public void setDocumento(byte[] documento) {
        this.documento = documento;
    }

    public String getPublicacion() {
        return publicacion;
    }

    public void setPublicacion(String publicacion) {
        this.publicacion = publicacion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getTipoCurso() {
        return tipoCurso;
    }

    public void setTipoCurso(String tipoCurso) {
        this.tipoCurso = tipoCurso;
    }

    public String getFechaPublicacion() {
        return fechaPublicacion;
    }

    public void setFechaPublicacion(String fechaPublicacion) {
        this.fechaPublicacion = fechaPublicacion;
    }
}
