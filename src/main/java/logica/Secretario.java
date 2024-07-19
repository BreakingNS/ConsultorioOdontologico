package logica;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

@Entity
public class Secretario extends Persona{
    //private int id_secretario; 
    private String Sector;
    @OneToOne 
    private Usuario unUsuario;

    public Secretario() {
    }

    public Secretario(String Sector, Usuario unUsuario, int id, String dni, String nombre, String apellido, String direccion, String telefono, Date fecha_nac) {
        super(id, dni, nombre, apellido, direccion, telefono, fecha_nac);
        this.Sector = Sector;
        this.unUsuario = unUsuario;
    }

    public Usuario getUnUsuario() {
        return unUsuario;
    }

    public void setUnUsuario(Usuario unUsuario) {
        this.unUsuario = unUsuario;
    }
    /*
    public int getId_secretario() {
        return id_secretario;
    }
    */
    public String getSector() {
        return Sector;
    }
    /*
    public void setId_secretario(int id_secretario) {
        this.id_secretario = id_secretario;
    }
    */
    public void setSector(String Sector) {
        this.Sector = Sector;
    }
    
    
}
