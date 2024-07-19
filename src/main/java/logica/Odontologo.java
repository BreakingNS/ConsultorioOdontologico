package logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Odontologo extends Persona implements Serializable{
    //private int id_odontologo;
    private String especialidad;
    @OneToMany(mappedBy="odonto")
    private List<Turno> listaTurnos;
    @OneToOne
    private Usuario unUsuario;
    @OneToOne
    private Horario unHorario;

    public Odontologo() {
    }

    public Odontologo(String especialidad, List<Turno> listaTurnos, Usuario unUsuario, Horario unHorario, int id, String dni, String nombre, String apellido, String direccion, String telefono, Date fecha_nac) {
        super(id, dni, nombre, apellido, direccion, telefono, fecha_nac);
        this.especialidad = especialidad;
        this.listaTurnos = listaTurnos;
        this.unUsuario = unUsuario;
        this.unHorario = unHorario;
    }

    public List<Turno> getListaTurnos() {
        return listaTurnos;
    }

    public Usuario getUnUsuario() {
        return unUsuario;
    }

    public Horario getUnHorario() {
        return unHorario;
    }

    public void setListaTurnos(List<Turno> listaTurnos) {
        this.listaTurnos = listaTurnos;
    }

    public void setUnUsuario(Usuario unUsuario) {
        this.unUsuario = unUsuario;
    }

    public void setUnHorario(Horario unHorario) {
        this.unHorario = unHorario;
    }
    /*
    public int getId_odontologo() {
        return id_odontologo;
    }
    */
    public String getEspecialidad() {
        return especialidad;
    }
    /*
    public void setId_odontologo(int id_odontologo) {
        this.id_odontologo = id_odontologo;
    }
    */
    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    
    
}
