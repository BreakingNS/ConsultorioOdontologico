package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
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

@WebServlet(name = "SvOdontologos", urlPatterns = {"/SvOdontologos"})
public class SvOdontologos extends HttpServlet {

    ControladoraLogica control = new ControladoraLogica();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Odontologo> listaOdontologos = new ArrayList<Odontologo>();
        
        listaOdontologos = control.getOdontologos();
        
        HttpSession misession = request.getSession();
        misession.setAttribute("listaOdontologos", listaOdontologos);
        
        response.sendRedirect("verOdontologos.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Declaracion de atributos traidos de altaOdontologo
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
        String usuarioIdStr = (String)request.getParameter("usuario");
        int idUsuario = Integer.parseInt(usuarioIdStr);
        
        /*
        //Creando List de los dias que se van a atender
        List<String> listaDiasSeleccionados = null;
        List<String> listaDiasSeleccionadosFinal = null;
        for(String dia : diasSeleccionados){
            listaDiasSeleccionados.add(dia);
            System.out.println(dia);
        }
        */
        //Declaracion del atributo tipo unHorario
        String horaIni = (String)request.getParameter("horaIni");
        String horaFin = (String)request.getParameter("horaFin");
        int tiempoTurno = Integer.parseInt(request.getParameter("tiempoTurno"));

        //prueba dias
        //for(String dia : diasSeleccionados){
        //    System.out.println(dia);
        //}
        //
        
        //prueba horas minutos
        System.out.println("Hora inicio: " + horaIni + "hora fin: " + horaFin + " tiempo turno " + tiempoTurno);
        //
        
        //Edicion del dispo del usuario seleccionado
        Usuario usuario = control.traerUsuario(idUsuario);
        usuario.setDispo(false);
        control.editarUsuario(usuario);
        
        //Creacion y carga de tabla Horario
        Horario horario = new Horario();
        
        horario.setHorario_inicio(horaIni);
        horario.setHorario_fin(horaFin);
        horario.setDuracionTurnoMinutos(tiempoTurno);
        horario.setDiasAtencion(diasSeleccionadosStr);
        
        control.crearHorario(horario);
        
        //Creacion y carga de odontologo
        Odontologo odonto = new Odontologo(especialidad, null, 
                usuario, horario, 0, dni, nombre, apellido, 
                direccion, telefono, fechanac);
        
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
        
        control.crearOdontologo(odonto);
        
        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
