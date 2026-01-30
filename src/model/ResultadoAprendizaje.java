package model;

public class ResultadoAprendizaje {
    private int id;
    private String descripcion;
    private int asignaturaId;

    public ResultadoAprendizaje() {
    }

    public ResultadoAprendizaje(int id, String descripcion, int asignaturaId) {
        this.id = id;
        this.descripcion = descripcion;
        this.asignaturaId = asignaturaId;
    }

    public ResultadoAprendizaje(String descripcion, int asignaturaId) {
        this.descripcion = descripcion;
        this.asignaturaId = asignaturaId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getAsignaturaId() {
        return asignaturaId;
    }

    public void setAsignaturaId(int asignaturaId) {
        this.asignaturaId = asignaturaId;
    }
}
