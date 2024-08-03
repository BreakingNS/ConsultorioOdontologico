package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.ControladoraLogica;
import logica.Turno;

@WebServlet(name = "SvFiltrarHora", urlPatterns = {"/SvFiltrarHora"})
public class SvFiltrarHora extends HttpServlet {

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
        
        HttpSession misession = request.getSession();
        List<Turno> listaTurnosInicio = (List<Turno>)misession.getAttribute("listaTurnos");
        List<Turno> listaTurnosFinal = new ArrayList<Turno>();
        
        String fechaString = request.getParameter("fecha");
        Date fecha = null;
        
        if(fechaString != null && !fechaString.isEmpty()){
            SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
            try {
                fecha = sdf.parse(fechaString);
            } catch (ParseException ex) {
                Logger.getLogger(SvFiltrarHora.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else{
            System.out.println("No se ha seleccionado ninguna fecha.");
        }
        
        for(Turno turno : listaTurnosInicio){
            if(turno.getFecha_turno().equals(fecha)){
                if(turno.getDisponible() == true){
                    listaTurnosFinal.add(turno);
                }
            }
        }
        
        Collections.sort(listaTurnosFinal, new Comparator<Turno>() {
            @Override
            public int compare(Turno t1, Turno t2) {
                return t1.getHora_turno().compareTo(t2.getHora_turno());
            }
        });
        
        
        
        for(Turno turno : listaTurnosFinal){
            
            System.out.println(turno.getHora_turno());
            
        }

        misession.setAttribute("listaTurnosDia", listaTurnosFinal);
        misession.setAttribute("diaSelected", fecha);
        
        response.sendRedirect("altaTurnosHora.jsp");
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
