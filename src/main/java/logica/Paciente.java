package logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Paciente extends Persona implements Serializable{
    //private int id_paciente ; 
    private Boolean tiene_OS; 
    private String tipo_sangre;
    @OneToOne
    private Responsable unResponsable;
    @OneToMany(mappedBy="pacien")
    private List<Turno> listaTurno;
    

    public Paciente() {
    }

    public Paciente(Boolean tiene_OS, String tipo_sangre, Responsable unResponsable, List<Turno> listaTurno, int id, String dni, String nombre, String apellido, String direccion, String telefono, Date fecha_nac) {
        super(id, dni, nombre, apellido, direccion, telefono, fecha_nac);
        this.tiene_OS = tiene_OS;
        this.tipo_sangre = tipo_sangre;
        this.unResponsable = unResponsable;
        this.listaTurno = listaTurno;
    }
    
    public Responsable getUnResponsable() {
        return unResponsable;
    }

    public List<Turno> getListaTurno() {
        return listaTurno;
    }

    public void setUnResponsable(Responsable unResponsable) {
        this.unResponsable = unResponsable;
    }

    public void setListaTurno(List<Turno> listaTurno) {
        this.listaTurno = listaTurno;
    }
    /*
    public int getId_paciente() {
        return id_paciente;
    }
    */
    public Boolean getTiene_OS() {
        return tiene_OS;
    }

    public String getTipo_sangre() {
        return tipo_sangre;
    }
    /*
    public void setId_paciente(int id_paciente) {
        this.id_paciente = id_paciente;
    }
    */
    public void setTiene_OS(Boolean tiene_OS) {
        this.tiene_OS = tiene_OS;
    }

    public void setTipo_sangre(String tipo_sangre) {
        this.tipo_sangre = tipo_sangre;
    }
    
    
}
