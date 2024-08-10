<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="logica.ControladoraLogica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<h1>Alta Secretario</h1>

    <form class="user" action="SvSecretarios" method="POST">
        
        <%
            ControladoraLogica control = new ControladoraLogica();
            List<Usuario> listaUsuarios = control.traerUsuarios();
        %>
        
        <div class="form-group col">
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="dni" name="dni"
                    placeholder="DNI">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="nombre" name="nombre"
                    placeholder="Nombre">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="apellido" name="apellido"
                    placeholder="Apellido">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="telefono" name="telefono"
                    placeholder="Teléfono">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="direccion" name="direccion"
                    placeholder="Dirección">
            </div>
            <div class="col-sm-6 mb-3">
                Fecha de Nacimiento
                <br>
                <input type="date" class="form-control form-control-user" id="fechanac" name="fechanac"
                    placeholder="Fecha de Nacimiento">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="sector" name="sector"
                    placeholder="Sector">
            </div>
            <div class="col-sm-6 mb-3">
                Usuarios
                <select id="usuario" name="usuario">
                    <option value="-">-</option>
                    <%for(Usuario usu : listaUsuarios){
                        if(usu.getRol().equals("Secretario/a") && usu.isDispo() != false){
                        %> 
                        <option value="<%=usu.getId_usuario()%>"><%=usu.getNombre_usuario()%></option>
                        <%
                        }
                    }
                    %>
                </select>
            </div>
            
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Crear Secretario
        </button>
    </form>

<%@ include file="components/bodyfinal.jsp"%>
