package logica;

import java.util.Date;
import javax.persistence.Entity;

@Entity
public class Responsable extends Persona{
    //private int id_responsable;
    private String tipo_responsabilidad;

    public Responsable() {
    }

    public Responsable(String tipo_responsabilidad, int id, String dni, String nombre, String apellido, String direccion, String telefono, Date fecha_nac) {
        super(id, dni, nombre, apellido, direccion, telefono, fecha_nac);
        this.tipo_responsabilidad = tipo_responsabilidad;
    }
    
    /*
    public int getId_responsable() {
        return id_responsable;
    }
    */
    public String getTipo_responsabilidad() {
        return tipo_responsabilidad;
    }
    /*
    public void setId_responsable(int id_responsable) {
        this.id_responsable = id_responsable;
    }
    */
    public void setTipo_responsabilidad(String tipo_responsabilidad) {
        this.tipo_responsabilidad = tipo_responsabilidad;
    }
    
    
}
