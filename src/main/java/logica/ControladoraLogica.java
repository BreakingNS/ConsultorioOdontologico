package logica;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import persistencia.ControladoraPersistencia;

public class ControladoraLogica {
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    
    public void crearUsuario(String nombreUsuario, String contrasenia, String rol, boolean dispo){
        Usuario usu = new Usuario();
        usu.setNombre_usuario(nombreUsuario);
        usu.setContrasenia(contrasenia);
        usu.setRol(rol);
        usu.setDispo(dispo);
        controlPersis.crearUsuario(usu);
    }

    public List<Usuario> getUsuarios() {
        return controlPersis.getUsuarios();
    }

    public void borrarUsuario(int id) {
        controlPersis.borrarUsuario(id);
    }

    public Usuario traerUsuario(int id) {
        return controlPersis.traerUsuario(id);
    }

    public void editarUsuario(Usuario usu) {
        controlPersis.editarUsuario(usu);
    }

    public boolean comprobarIngreso(String usuario, String contrasenia) {
        boolean ingreso = false;
        
        List<Usuario> listaUsuarios = new ArrayList<Usuario>();
        listaUsuarios = controlPersis.getUsuarios();
        
        for(Usuario usu : listaUsuarios){
            if(usu.getNombre_usuario().equals(usuario)){
                if(usu.getContrasenia().equals(contrasenia)){
                    ingreso = true;
                }else{
                    ingreso = false;
                }
            }
        }
        
        return ingreso;
    }

    public List<Paciente> getPacientes() {
        return controlPersis.getPacientes();
    }

    public void borrarPaciente(int id) {
        controlPersis.borrarPaciente(id);
    }
    
    public void crearPaciente(Paciente pac){
        controlPersis.crearPaciente(pac);
    }

    public void crearPaciente(String dni, String nombre, String apellido, 
            String direccion, String telefono, Date fechanac, Boolean osocial, 
            String tiposan, int respo) {
        Paciente pac = new Paciente();
        pac.setDni(dni);
        pac.setNombre(nombre);
        pac.setApellido(apellido);
        pac.setDireccion(direccion);
        pac.setTelefono(telefono);
        pac.setFecha_nac(fechanac);
        pac.setTiene_OS(osocial);
        pac.setTipo_sangre(tiposan);
        
        List<Responsable> listaResponsable = getResponsables();
        Responsable responsable = null;
        
        for(Responsable rsp : listaResponsable){
            if(rsp.getId() == respo){
                responsable = rsp;
            }
        }
        pac.setUnResponsable(responsable);
        
        controlPersis.crearPaciente(pac);

    }

    public List<Responsable> getResponsables() {
        return controlPersis.getResponsables();
    }

    public Paciente traerPaciente(int id) {
        return controlPersis.traerPaciente(id);
    }

    public Responsable traerResponsable(int respoId) {
        return controlPersis.traerResponsable(respoId);
    }

    public void editarPaciente(Paciente pac) {
        controlPersis.editarPaciente(pac);
    }
    
    public List<Usuario> traerUsuarios(){
        return controlPersis.traerUsuarios();
    }

    public void crearOdontologo(Odontologo odonto) {
        controlPersis.crearOdontologo(odonto);
    }

    public void crearHorario(Horario horario) {
        controlPersis.crearHorario(horario);
    }

    public List<Odontologo> getOdontologos() {
        return controlPersis.getOdontologos();    
    }

    public void borrarOdontologo(int id) {
        controlPersis.borrarOdontologo(id);
    }

    public Odontologo traerOdontologo(int id) {
        return controlPersis.traerOdontologo(id);
    }

    public void editarOdontologo(Odontologo odonto) {
        controlPersis.editarOdontologo(odonto);
    }

    public List<Odontologo> traerFiltroOdontos(String espe) {
        
        List<Odontologo> listaOdontologos = controlPersis.getOdontologos();
        List<Odontologo> odontoFiltrados= new ArrayList<Odontologo>();
        
        for(Odontologo odo : listaOdontologos){
            if(odo.getEspecialidad().equals(espe)){
                odontoFiltrados.add(odo);
            }
        }
        
        return odontoFiltrados;
    }

    public Paciente traerPacientePorDni(int dniPacInt) {
    List<Paciente> listaPacientes = controlPersis.getPacientes();
    Paciente pacienteSelect = null;

    for (Paciente pac : listaPacientes) {
        try {
            // Asegúrate de que pac.getDni() puede ser convertido a int
            int dniPaciente = Integer.parseInt(pac.getDni());
            if (dniPaciente == dniPacInt) {
                //System.out.println("Nombre: " + pac.getNombre());
                pacienteSelect = pac;
                break;
            }
        } catch (NumberFormatException e) {
            // Maneja el caso donde el DNI no es un número válido
            System.err.println("Error al convertir el DNI del paciente: " + pac.getDni());
        }
    }

    return pacienteSelect;
}

    public void crearTurno(Turno turnoNuevo) {
        controlPersis.crearTurno(turnoNuevo);
    }

    public Turno traerTurno(int idHora) {
        return controlPersis.traerTurno(idHora);
    }

    public void editarTurno(Turno nuevoTurno) {
        controlPersis.editarTurno(nuevoTurno);
    }

    public void borrarTurnosOdontologo(Odontologo odonto) {
        List<Turno> listaTurnos = controlPersis.traerTurnos();

        for(Turno turno : listaTurnos){
            if(turno.getOdonto().getId()==odonto.getId()){
                controlPersis.borrarTurno(turno.getId_turno());
            }
        }
    }
    
    public List<Turno> getTurnos(){
        return controlPersis.getTurnos();
    }

    public void borrarHorario(int id_horario) {
        controlPersis.borrarHorario(id_horario);
    }

    public void crearResponsable(Responsable respo) {
        controlPersis.crearResponsable(respo);
    }

    public void crearSecretario(Secretario secre) {
        controlPersis.crearSecretario(secre);
    }

    public List<Secretario> getSecretarios() {
        return controlPersis.getSecretarios();
    }

    public void borrarResponsable(int idRespo) {
        controlPersis.borrarResponsable(idRespo);
    }

    public void editarResponsable(Responsable respo) {
        controlPersis.editarResponsable(respo);
    }

    public void borrarSecretario(int id) {
        controlPersis.borrarSecretario(id);
    }

    public Secretario traerSecretario(int id) {
        return controlPersis.traerSecretario(id);
    }

    public void editarSecretario(Secretario secre) {
        controlPersis.editarSecretario(secre);
    }

    public void editarHorario(Horario horario) {
        controlPersis.editarHorario(horario);
    }

    public boolean responsableTienePaciente(int idRespo) {
        List<Paciente> listaPacientes = controlPersis.getPacientes();
        boolean tienePac = false; 
        
        for(Paciente pac : listaPacientes){
            if(pac.getUnResponsable() != null && pac.getUnResponsable().getApellido() != null){
                if(pac.getUnResponsable().getId() == idRespo){
                    tienePac = true;
                    break;
                }
            }
        }
        
        return tienePac;
    }

    public Paciente traerPacientePorResponsable(int idRespo) {
        List<Paciente> listaPacientes = controlPersis.getPacientes();
        Paciente paciente = null;
        
        for(Paciente pac : listaPacientes){
            if(pac.getUnResponsable().getId() == idRespo){
                paciente = pac;
                break;
            }
        }
        
        return paciente;
    }
    
    
}
