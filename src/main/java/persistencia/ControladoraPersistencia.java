package persistencia;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Horario;
import logica.Odontologo;
import logica.Paciente;
import logica.Responsable;
import logica.Secretario;
import logica.Turno;
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

    public void borrarOdontologo(int id) {
        try {
            odontoJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Odontologo traerOdontologo(int id) {
        return odontoJPA.findOdontologo(id);
    }

    public void editarOdontologo(Odontologo odonto) {
        try {
            odontoJPA.edit(odonto);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Turno> traerTurnos() {
        return turnJPA.findTurnoEntities();
    }

    public void crearTurno(Turno turnoNuevo) {
        turnJPA.create(turnoNuevo);
    }

    public Turno traerTurno(int idHora) {
        return turnJPA.findTurno(idHora);
    }

    public void editarTurno(Turno nuevoTurno) {
        try {
            turnJPA.edit(nuevoTurno);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarTurno(int id_turno) {
        try {
            turnJPA.destroy(id_turno);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Turno> getTurnos() {
        return turnJPA.findTurnoEntities();
    }

    public void borrarHorario(int id_horario) {
        try {
            horaJPA.destroy(id_horario);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearResponsable(Responsable respo) {
        respJPA.create(respo);
    }

    public void crearSecretario(Secretario secre) {
        secreJPA.create(secre);
    }

    public List<Secretario> getSecretarios() {
        return secreJPA.findSecretarioEntities();
    }

    public void borrarResponsable(int idRespo) {
        try {
            respJPA.destroy(idRespo);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarResponsable(Responsable respo) {
        try {
            respJPA.edit(respo);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarSecretario(int id) {
        try {
            secreJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Secretario traerSecretario(int id) {
        return secreJPA.findSecretario(id);
    }

    public void editarSecretario(Secretario secre) {
        try {
            secreJPA.edit(secre);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarHorario(Horario horario) {
        try {
            horaJPA.edit(horario);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}

/*
    HorarioJpaController horaJPA = new HorarioJpaController();
    OdontologoJpaController odontoJPA = new OdontologoJpaController();
    PacienteJpaController pacJPA = new PacienteJpaController();
    PersonaJpaController persJPA = new PersonaJpaController();
    ResponsableJpaController respJPA = new ResponsableJpaController();
    SecretarioJpaController secreJPA = new SecretarioJpaController();
    TurnoJpaController turnJPA = new TurnoJpaController();
    UsuarioJpaController usuJPA = new UsuarioJpaController();
*/