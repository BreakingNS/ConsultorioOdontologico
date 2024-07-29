package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Odontologo;
import logica.Paciente;
import logica.ServicioTurnos;
import logica.Turno;

@WebServlet(name = "SvReservarTurnos", urlPatterns = {"/SvReservarTurnos"})
public class SvReservarTurnos extends HttpServlet {
    
    //private ServicioTurnos servicioTurnos = new ServicioTurnos();
    
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
        
        String fecha = request.getParameter("fecha");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date dia = null;
        
        try {
            dia = dateFormat.parse(fecha);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        List<Turno> turnosReservados = obtenerTurnosReservadosParaDia(dia);
        
        //List<Turno> turnosDisponibles = servicioTurnos.obtenerTurnosDisponibles(dia, turnosReservados);
        
        //request.setAttribute("turnosDisponibles", turnosDisponibles);
        //request.getRequestDispatcher("/mostrarTurnos.jsp").forward(request, response);
    }
    
    private List<Turno> obtenerTurnosReservadosParaDia(Date dia){
        return List.of(
            new Turno(1, dia, "10:00", "Afección X", false, new Odontologo(), new Paciente()),
            new Turno(2, dia, "11:00", "Afección Y", false, new Odontologo(), new Paciente())
        );
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
