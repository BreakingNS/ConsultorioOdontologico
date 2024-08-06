package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.ControladoraLogica;
import logica.Paciente;

@WebServlet(name = "SvBuscarPaciente", urlPatterns = {"/SvBuscarPaciente"})
public class SvBuscarPaciente extends HttpServlet {

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
    
        String dniPac = (String)request.getParameter("dniPaciente");
        int dniPacInt = Integer.parseInt(dniPac);

        Paciente paciente = control.traerPacientePorDni(dniPacInt);

            //System.out.println("dni " + paciente.getDni());

        HttpSession misession = request.getSession();
        misession.setAttribute("pacienteSelected", paciente);
        misession.setAttribute("dniSelected", dniPac);

        if (paciente != null && paciente.getDni().equals(dniPac)) {
            response.sendRedirect("altaTurnosEspe.jsp");
        } else {
            response.sendRedirect("altaTurnosPacienNo.jsp");
        }
    
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
