package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.ControladoraLogica;
import logica.Paciente;
import logica.Responsable;

@WebServlet(name = "SvElimResponsable", urlPatterns = {"/SvElimResponsable"})
public class SvElimResponsable extends HttpServlet {

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
        
        int idRespo = Integer.parseInt(request.getParameter("id"));
        Paciente pacSinRespo = null;
        
        if(control.responsableTienePaciente(idRespo) == true){
            pacSinRespo = control.traerPacientePorResponsable(idRespo);
        }
        
        control.editarPaciente(pacSinRespo);
        control.borrarResponsable(idRespo);
        
        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
