/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author steve
 */
public class Mensaje {
    private String id;
    private String asunto;
    private String contenido;
    private String fecha;
    
    // Constructor
    public Mensaje(String id, String asunto, String contenido, String fecha) {
        this.id = id;
        this.asunto = asunto;
        this.contenido = contenido;
        this.fecha = fecha;
    }
    
    // Getters y setters
    
    public String getId() {
        return id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    
    public String getAsunto() {
        return asunto;
    }
    
    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }
    
    public String getContenido() {
        return contenido;
    }
    
    public void setContenido(String contenido) {
        this.contenido = contenido;
    }
    
    public String getFecha() {
        return fecha;
    }
    
    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
}

