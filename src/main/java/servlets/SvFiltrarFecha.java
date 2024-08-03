package servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.ControladoraLogica;
import logica.Odontologo;
import logica.Turno;

@WebServlet(name = "SvFiltrarFecha", urlPatterns = {"/SvFiltrarFecha"})
public class SvFiltrarFecha extends HttpServlet {

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
        
        int idOdonto = Integer.parseInt(request.getParameter("odontologo"));
        
        Odontologo odonto = control.traerOdontologo(idOdonto);
        
        List<Turno> listaTurnos = odonto.getListaTurnos();
        /*
        for(Turno turno : listaTurnos){
            System.out.println("Fecha " + turno.getFecha_turno() + 
                    " Hora " + turno.getHora_turno() +  
                    " Disponible " + turno.getDisponible());
        }
        */
        HttpSession misession = request.getSession();
        misession.setAttribute("listaTurnos", listaTurnos);
        misession.setAttribute("odontologoSelected", odonto);
        
        response.sendRedirect("altaTurnosFecha.jsp");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
