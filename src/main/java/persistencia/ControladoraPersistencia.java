package persistencia;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Horario;
import logica.Odontologo;
import logica.Paciente;
import logica.Responsable;
import logica.Usuario;
import persistencia.exceptions.NonexistentEntityException;

public class ControladoraPersistencia {
    HorarioJpaController horaJPA = new HorarioJpaController();
    OdontologoJpaController odontoJPA = new OdontologoJpaController();
    PacienteJpaController pacJPA = new PacienteJpaController();
    PersonaJpaController persJPA = new PersonaJpaController();
    ResponsableJpaController respJPA = new ResponsableJpaController();
    SecretarioJpaController secreJPA = new SecretarioJpaController();
    TurnoJpaController turnJPA = new TurnoJpaController();
    UsuarioJpaController usuJPA = new UsuarioJpaController();

    public ControladoraPersistencia() {
    }
    
    public void crearUsuario(Usuario usu) {
        usuJPA.create(usu);
    }

    public List<Usuario> getUsuarios() {
        return usuJPA.findUsuarioEntities();
    }

    public void borrarUsuario(int id) {
        try {
            usuJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Usuario traerUsuario(int id) {
        return usuJPA.findUsuario(id);
    }

    public void editarUsuario(Usuario usu) {
        try {
            usuJPA.edit(usu);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Paciente> getPacientes() {
        return pacJPA.findPacienteEntities();
    }

    public void borrarPaciente(int id) {
        try {
            pacJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Responsable> getResponsables() {
        return respJPA.findResponsableEntities();
    }

    public void crearPaciente(Paciente pac) {
        pacJPA.create(pac);
    }

    public Paciente traerPaciente(int id) {
        return pacJPA.findPaciente(id);
    }

    public Responsable traerResponsable(int respoId) {
        return respJPA.findResponsable(respoId);
    }

    public void editarPaciente(Paciente pac) {
        try {
            pacJPA.edit(pac);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Usuario> traerUsuarios() {
        return usuJPA.findUsuarioEntities();
    }

    public void crearOdontologo(Odontologo odonto) {
        odontoJPA.create(odonto);
    }

    public void crearHorario(Horario horario) {
        horaJPA.create(horario);
    }

    public List<Odontologo> getOdontologos() {
        return odontoJPA.findOdontologoEntities();
    }

    
}
