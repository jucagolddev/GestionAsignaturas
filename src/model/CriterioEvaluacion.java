package model;

public class CriterioEvaluacion {
    private int id;
    private String descripcion;
    private int raId;

    public CriterioEvaluacion() {
    }

    public CriterioEvaluacion(int id, String descripcion, int raId) {
        this.id = id;
        this.descripcion = descripcion;
        this.raId = raId;
    }

    public CriterioEvaluacion(String descripcion, int raId) {
        this.descripcion = descripcion;
        this.raId = raId;
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

    public int getRaId() {
        return raId;
    }

    public void setRaId(int raId) {
        this.raId = raId;
    }
}
