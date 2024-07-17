package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.ControladoraLogica;
import logica.Paciente;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Responsable;


@WebServlet(name = "SvEditPacientes", urlPatterns = {"/SvEditPacientes"})
public class SvEditPacientes extends HttpServlet {

    ControladoraLogica control = new ControladoraLogica();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        Paciente pac= control.traerPaciente(id);
        
        HttpSession misession = request.getSession();
        misession.setAttribute("pacEditar", pac);
        
        response.sendRedirect("editarPaciente.jsp");
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String dni = (String)request.getParameter("dni");
        String nombre = (String)request.getParameter("nombre");
        String apellido = (String)request.getParameter("apellido");
        String direccion = (String)request.getParameter("direccion");
        String telefono = (String)request.getParameter("telefono");
        
        String fechanacStr = request.getParameter("fechanac");
        Date fechanac = null;
        try {
            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");
            fechanac = inputFormat.parse(fechanacStr);
            String formattedDate = outputFormat.format(fechanac);

            // Aquí puedes guardar 'formattedDate' en la base de datos en el formato que prefieras

        } catch (ParseException ex) {
            Logger.getLogger(SvPacientes.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String osocialStr = request.getParameter("osocial");
        Boolean osocial = Boolean.parseBoolean(osocialStr);
        
        String tiposan = (String)request.getParameter("tiposan");
        
        int respoId = Integer.parseInt(request.getParameter("responsable"));
        
        Responsable respo = control.traerResponsable(respoId);
        
        Paciente pac = (Paciente)request.getSession().getAttribute("pacEditar");
        
        pac.setDni(dni);
        pac.setNombre(nombre);
        pac.setApellido(apellido);
        pac.setDireccion(direccion);
        pac.setTelefono(telefono);
        pac.setFecha_nac(fechanac);
        pac.setTiene_OS(osocial);
        pac.setTipo_sangre(tiposan);
        pac.setUnResponsable(respo);
        
        control.editarPaciente(pac);
        
        response.sendRedirect("index.jsp");
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
