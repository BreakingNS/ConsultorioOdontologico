package servlets;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.ControladoraLogica;
import logica.Odontologo;
import logica.Paciente;
import logica.Turno;

@WebServlet(name = "SvGuardarTurno", urlPatterns = {"/SvGuardarTurno"})
public class SvGuardarTurno extends HttpServlet {

    ControladoraLogica control = new ControladoraLogica();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("ENTRO AL SERVLET");
        
        /*
        private int id_turno;
        private Date fecha_turno; -
        private String hora_turno; - 
        private String afeccion;
        private boolean disponible; -
        private Odontologo odonto;
        private Paciente pacien;
        */
        
        String idTurnoHoraString = (String)request.getParameter("hora");
        int idHora = Integer.parseInt(idTurnoHoraString);
        
        Turno nuevoTurno = control.traerTurno(idHora);
        
        //Asignar nuevos valores
        boolean dispo = false;
        Paciente pacien = (Paciente)request.getSession().getAttribute("pacienteSelected");
        
        nuevoTurno.setDisponible(dispo);
        nuevoTurno.setPacien(pacien);
        
        
        control.editarTurno(nuevoTurno);
        
        HttpSession misession = request.getSession();
        misession.setAttribute("turnoCreado", nuevoTurno);
        
        response.sendRedirect("turnoCreado.jsp");
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
