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
import logica.ControladoraLogica;
import logica.Horario;
import logica.Odontologo;
import logica.Turno;
import logica.Usuario;

@WebServlet(name = "SvOdontologo", urlPatterns = {"/SvOdontologo"})
public class SvOdontologo extends HttpServlet {

    ControladoraLogica control = new ControladoraLogica();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvOdontologo</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvOdontologo at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Turno> listaTurnos = new ArrayList<Turno>();
        
        String dni = (String)request.getParameter("dni");
        String nombre = (String)request.getParameter("nombre");
        String apellido = (String)request.getParameter("apellido");
        String telefono = (String)request.getParameter("telefono");
        String direccion = (String)request.getParameter("direccion");
        
        String fechanacStr = request.getParameter("fechanac");
        Date fechanac = null;
        try {
            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");
            fechanac = inputFormat.parse(fechanacStr);
            String formattedDate = outputFormat.format(fechanac);

            // Aquí puedes guardar 'formattedDate' en la base de datos en el formato que prefieras

        } catch (ParseException ex) {
            Logger.getLogger(SvOdontologo.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String especialidad = (String)request.getParameter("especialidad");
        
        String usuarioIdStr = (String) request.getParameter("usuario");
        int idUsuario = Integer.parseInt(usuarioIdStr);
        
        Usuario usuario = control.traerUsuario(idUsuario);
        
        Horario horario = new Horario();
        
        control.crearHorario(horario);
        
        Odontologo odonto = new Odontologo(especialidad, listaTurnos, 
                usuario, horario, 0, dni, nombre, apellido, 
                direccion, telefono, fechanac);
        
        control.crearOdontologo(odonto);
        
        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
