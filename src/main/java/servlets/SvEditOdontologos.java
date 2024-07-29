package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.ControladoraLogica;
import logica.Horario;
import logica.Odontologo;
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
        
        HttpSession misession = request.getSession();
        misession.setAttribute("odontoEditar", odonto);
        
        response.sendRedirect("editarOdontologo.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
            Logger.getLogger(SvOdontologos.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String especialidad = (String)request.getParameter("especialidad");
        
        String usuarioIdStr = (String) request.getParameter("usuario");
        int idUsuario = Integer.parseInt(usuarioIdStr);
        
        Usuario usuario = control.traerUsuario(idUsuario);
        
        Odontologo odonto = (Odontologo)request.getSession().getAttribute("odontoEditar");
        
        odonto.setDni(dni);
        odonto.setNombre(nombre);
        odonto.setApellido(apellido);
        odonto.setTelefono(telefono);
        odonto.setDireccion(direccion);
        odonto.setFecha_nac(fechanac);
        odonto.setEspecialidad(especialidad);
        odonto.setUnUsuario(usuario);
        
        control.editarOdontologo(odonto);
        
        response.sendRedirect("index.jsp");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
