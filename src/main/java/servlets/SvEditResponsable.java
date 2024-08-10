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
import logica.Responsable;

@WebServlet(name = "SvEditResponsable", urlPatterns = {"/SvEditResponsable"})
public class SvEditResponsable extends HttpServlet {

    ControladoraLogica control = new ControladoraLogica();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idRespo = Integer.parseInt(request.getParameter("id"));
        
        Responsable respoEditar = control.traerResponsable(idRespo);
        
        HttpSession misession = request.getSession();
        misession.setAttribute("respoEditar", respoEditar);
        
        response.sendRedirect("editarResponsable.jsp");
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
        
        String tipoResponsable = (String)request.getParameter("tipoResp");

        Responsable respo = (Responsable)request.getSession().getAttribute("respoEditar");
        
        respo.setDni(dni);
        respo.setApellido(apellido);
        respo.setNombre(nombre);
        respo.setDireccion(direccion);
        respo.setTelefono(telefono);
        respo.setFecha_nac(fechanac);
        respo.setTipo_responsabilidad(tipoResponsable);
        
        control.editarResponsable(respo);
        
        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
