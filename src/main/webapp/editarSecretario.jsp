<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Secretario"%>
<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="logica.ControladoraLogica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<h1>Modificar Secretario</h1>
<p>Este es el apartado para modificar un secretario</p>

    <form class="user" action="SvEditSecretarios" method="POST">
        
        <%
            Secretario secre = (Secretario)request.getSession().getAttribute("secreEditar");
    
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            String fechaNacFormateada = (secre != null && secre.getFecha_nac() != null) ? format.format(secre.getFecha_nac()) : "";

            ControladoraLogica control = new ControladoraLogica();
            List<Usuario> listaUsuarios = control.traerUsuarios();
            
            for(Usuario usu : listaUsuarios){
                if(usu.getId_usuario() == secre.getUnUsuario().getId_usuario()){
                    usu.setDispo(true);
                    control.editarUsuario(usu);
                    break;
                }
            }

            int idUsuario;
            Usuario usuEdit = null;

            if(secre.getUnUsuario() != null){
                idUsuario = secre.getUnUsuario().getId_usuario();
                usuEdit = control.traerUsuario(idUsuario);
            }
        %>
        
        <div class="form-group col">
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="dni" name="dni"
                    placeholder="DNI" value="<%=secre.getDni()%>">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="nombre" name="nombre"
                    placeholder="Nombre" value="<%=secre.getNombre()%>">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="apellido" name="apellido"
                    placeholder="Apellido" value="<%=secre.getApellido()%>">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="telefono" name="telefono"
                    placeholder="Teléfono" value="<%=secre.getTelefono()%>">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="direccion" name="direccion"
                    placeholder="Dirección" value="<%=secre.getDireccion()%>">
            </div>
            <div class="col-sm-6 mb-3">
                Fecha de Nacimiento
                <br>
                <input type="date" class="form-control form-control-user" id="fechanac" name="fechanac"
                       placeholder="Fecha de Nacimiento" value="<%=fechaNacFormateada %>">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="sector" name="sector"
                    placeholder="Sector" value="<%=secre.getSector()%>">
            </div>
            <div class="col-sm-6 mb-3">
                Usuarios
                <select id="usuario" name="usuario">
                    <option value="-" <%= usuEdit == null ? "selected" : "" %>>-</option>
                    <% 
                    for (Usuario usu : listaUsuarios) { 
                        if (usu.getRol().equals("Secretario/a") && usu.isDispo() == true) { %> 
                            <option value="<%= usu.getId_usuario() %>"
                                    <%= (usuEdit != null && usu.getId_usuario() == usuEdit.getId_usuario()) ? "selected" : "" %>>
                                <%= usu.getNombre_usuario() %>
                            </option>
                    <%  } 
                    } 
                    %>
                </select>
            </div>
            
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Editar Secretario
        </button>
    </form>

<%@ include file="components/bodyfinal.jsp"%>
