<%@page import="java.util.List"%>
<%@page import="logica.Usuario"%>
<%@page import="logica.Odontologo"%>
<%@page import="logica.ControladoraLogica"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<h1>Modificar Odontologo</h1>
<p>Este es el apartado para modificar un odontologo</p>

<% 
    Odontologo odonto = (Odontologo)request.getSession().getAttribute("odontoEditar");
    
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    String fechaNacFormateada = (odonto != null && odonto.getFecha_nac() != null) ? format.format(odonto.getFecha_nac()) : "";
    
    ControladoraLogica control = new ControladoraLogica();
    List<Usuario> listaUsuarios = control.traerUsuarios();
    
    int idUsuario = odonto.getUnUsuario().getId_usuario();
    Usuario usuEdit = control.traerUsuario(idUsuario);
%>

    <form class="user" action="SvEditOdontologos" method="POST">
        <div class="form-group col">
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="dni" name="dni"
                    placeholder="DNI" value="<%=odonto.getDni()%>">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="nombre" name="nombre"
                    placeholder="Nombre" value="<%=odonto.getNombre()%>">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="apellido" name="apellido"
                    placeholder="Apellido" value="<%=odonto.getApellido()%>">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="telefono" name="telefono"
                    placeholder="Teléfono" value="<%=odonto.getTelefono()%>">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="direccion" name="direccion"
                    placeholder="Dirección" value="<%=odonto.getDireccion()%>">
            </div>
            <div class="col-sm-6 mb-3">
                Fecha de Nacimiento
                <br>
                <input type="date" class="form-control form-control-user" id="fechanac" name="fechanac"
                       placeholder="Fecha de Nacimiento" value="<%=fechaNacFormateada %>">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="especialidad" name="especialidad"
                    placeholder="Especialidad" value="<%=odonto.getEspecialidad()%>">
            </div>
            
            Usuarios
            <select id="usuario" name="usuario">
                <option value="<%=usuEdit.getId_usuario()%>"><%=usuEdit.getNombre_usuario()%></option>
                <%for(Usuario usu : listaUsuarios){
                    if(usu.getRol().equals("Odontologo/a")){
                    %> 
                    <option value="<%=usu.getId_usuario()%>"><%=usu.getNombre_usuario()%></option>
                    <%
                    }
                }
                %>
            </select>
            
            <!-- Acá va a ir todo lo que respecta a horarios y usuarios-->
        </div>
        
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Modificar Odontólogo
        </button>
    </form>

<%@ include file="components/bodyfinal.jsp"%>
