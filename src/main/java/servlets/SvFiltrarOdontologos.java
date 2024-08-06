package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.ControladoraLogica;
import logica.Odontologo;

@WebServlet(name = "SvFiltrarOdontologos", urlPatterns = {"/SvFiltrarOdontologos"})
public class SvFiltrarOdontologos extends HttpServlet {
    
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
        
        String espe = (String)request.getParameter("especialidad");
        
        List<Odontologo> odontoFiltrados= new ArrayList<Odontologo>();
        
        odontoFiltrados = control.traerFiltroOdontos(espe);
        
        HttpSession misession = request.getSession();
        misession.setAttribute("especialidadSelected", espe);
        misession.setAttribute("odontoFiltrados", odontoFiltrados);
        
        response.sendRedirect("altaTurnosOdonto.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
