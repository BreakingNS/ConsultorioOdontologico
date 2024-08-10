<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<h1>Editar Usuarios</h1>
<p>Este es el apartado para modificar un usuario del sistema.</p>

<% Usuario usu = (Usuario)request.getSession().getAttribute("usuEditar");%>

    <form class="user" action="SvEditUsuarios" method="POST">
        <div class="form-group col">
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id="nombreusu" name="nombreusu"
                       placeholder="Nombre Usuario" value="<%=usu.getNombre_usuario()%>">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="password" class="form-control form-control-user" id="constrasenia" name="contrasenia"
                    placeholder="Contraseña" value="<%=usu.getContrasenia()%>">
            </div>
            Rol
            <select id="rol" name="rol">
                <option value="-">-</option>
                <option value="Secretario/a" <%= "Secretario/a".equals(usu.getRol()) ? "selected" : "" %>>Secretario/a</option>
                <option value="Odontologo/a" <%= "Odontologo/a".equals(usu.getRol()) ? "selected" : "" %>>Odontólogo/a</option>
            </select>
            
            <!-- Acá va a ir todo lo que respecta a horarios y usuarios-->
        </div>
        
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Guardar Modificación
        </button>
    </form>

<%@ include file="components/bodyfinal.jsp"%>
