package logica;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import persistencia.ControladoraPersistencia;

public class ControladoraLogica {
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    
    public void crearUsuario(String nombreUsuario, String contrasenia, String rol){
        Usuario usu = new Usuario();
        usu.setNombre_usuario(nombreUsuario);
        usu.setContrasenia(contrasenia);
        usu.setRol(rol);
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

    private List<Responsable> getResponsables() {
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

}
