package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.ControladoraLogica;
import logica.DiaUtil;
import logica.Horario;
import logica.Odontologo;
import logica.ServicioTurnos;
import logica.Turno;
import logica.Usuario;

@WebServlet(name = "SvEditOdontologos", urlPatterns = {"/SvEditOdontologos"})
public class SvEditOdontologos extends HttpServlet {

    ControladoraLogica control = new ControladoraLogica();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        int id = Integer.parseInt(request.getParameter("id")) ;
        
        Odontologo odonto = control.traerOdontologo(id);
        
        Usuario usu = control.traerUsuario(odonto.getUnUsuario().getId_usuario());
        usu.setDispo(true);
        control.editarUsuario(usu);
        
        HttpSession misession = request.getSession();
        misession.setAttribute("odontoEditar", odonto);
        
        response.sendRedirect("editarOdontologo.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Odontologo odonto = (Odontologo)request.getSession().getAttribute("odontoEditar");
        
        control.borrarTurnosOdontologo(odonto);
        
        String dni = (String)request.getParameter("dni");
        String nombre = (String)request.getParameter("nombre");
        String apellido = (String)request.getParameter("apellido");
        String telefono = (String)request.getParameter("telefono");
        String direccion = (String)request.getParameter("direccion");
        String[] diasSeleccionados = request.getParameterValues("dias");
        String diasSeleccionadosStr = String.join(",", diasSeleccionados);
        
        System.out.println(diasSeleccionadosStr);
        
        String fechanacStr = request.getParameter("fechanac");
        Date fechanac = null;
        try {
            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");
            fechanac = inputFormat.parse(fechanacStr);
            String formattedDate = outputFormat.format(fechanac);

            // Aquí puedes guardar 'formattedDate' en la base de datos en el formato que prefieras

        } catch (ParseException ex) {
            Logger.getLogger(SvOdontologos.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String especialidad = (String)request.getParameter("especialidad");
        
        //condicion si se modifica el usuario
        String usuarioIdStr = (String) request.getParameter("usuario");
        int idUsuario = Integer.parseInt(usuarioIdStr);
        
        Usuario usuario = control.traerUsuario(idUsuario);
        
        if(!odonto.getUnUsuario().equals(usuario)){
            Usuario usuarioViejo = odonto.getUnUsuario();
            usuarioViejo.setDispo(true);
            control.editarUsuario(usuarioViejo);
            
            usuario.setDispo(false);
            control.editarUsuario(usuario);
        }
        
        Horario horario = new Horario();
        
        String horaIni = (String)request.getParameter("horaIni");
        String horaFin = (String)request.getParameter("horaFin");
        int tiempoTurno = Integer.parseInt(request.getParameter("tiempoTurno"));

        horario.setHorario_inicio(horaIni);
        horario.setHorario_fin(horaFin);
        horario.setDuracionTurnoMinutos(tiempoTurno);
        horario.setDiasAtencion(diasSeleccionadosStr);
        
        control.editarHorario(horario);
        
        odonto.setDni(dni);
        odonto.setNombre(nombre);
        odonto.setApellido(apellido);
        odonto.setTelefono(telefono);
        odonto.setDireccion(direccion);
        odonto.setFecha_nac(fechanac);
        odonto.setEspecialidad(especialidad);
        odonto.setUnHorario(horario);
        odonto.setUnUsuario(usuario);
        
        //Creacion de turnos para odontologo
        ServicioTurnos servTur = new ServicioTurnos(horaIni, horaFin, tiempoTurno, odonto);
        List<Turno> listaTurnos = new ArrayList<Turno>();
        
        for(String dia : diasSeleccionados){
            Date fechaAux = null;
            try {
                fechaAux = DiaUtil.convertirDiaSemanaAFecha(dia);
                //System.out.println(fechaAux);
            } catch (ParseException ex) {
                Logger.getLogger(SvOdontologos.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            listaTurnos = servTur.generarTurnosParaDia(fechaAux, listaTurnos);
        }
        
        odonto.setListaTurnos(listaTurnos);
        
        control.editarOdontologo(odonto);
        
        response.sendRedirect("index.jsp");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
