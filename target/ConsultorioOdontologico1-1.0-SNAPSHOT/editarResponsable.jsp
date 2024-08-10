
<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="logica.ControladoraLogica"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Responsable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<h1>Modificar Responsables</h1>
<p>Este es el apartado para modificar un responsable de los pacientes menores de edad</p>

<% 
    Responsable respo = (Responsable)request.getSession().getAttribute("respoEditar");
    
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    String fechaNacFormateada = (respo != null && respo.getFecha_nac() != null) ? format.format(respo.getFecha_nac()) : "";
    
    ControladoraLogica control = new ControladoraLogica();
    List<Usuario> listaUsuarios = control.traerUsuarios();
    
    int idUsuario;
    Usuario usuEdit = null;
%>

    <form class="user" action="SvEditResponsable" method="POST">
        <form class="user" action="SvEditResponsable" method="POST">
        <div class="form-group col">
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="dni" name="dni"
                    placeholder="DNI" value="<%=respo.getDni()%>">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="nombre" name="nombre"
                    placeholder="Nombre" value="<%=respo.getNombre()%>">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="apellido" name="apellido"
                    placeholder="Apellido" value="<%=respo.getApellido()%>">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="telefono" name="telefono"
                    placeholder="Teléfono" value="<%=respo.getTelefono()%>">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="direccion" name="direccion"
                    placeholder="Dirección" value="<%=respo.getDireccion()%>">
            </div>
            <div class="col-sm-6 mb-3">
                Fecha de Nacimiento
                <br>
                <input type="date" class="form-control form-control-user" id="fechanac" name="fechanac"
                       placeholder="Fecha de Nacimiento" value="<%=fechaNacFormateada %>">
            </div>
            <!-- Tipo Responsabilidad -->
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id="tipoResp" name="tipoResp"
                    placeholder="Tipo de Responsabilidad" value="<%=respo.getTipo_responsabilidad()%>">
            </div>
        </div>
        
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Editar Responsable
        </button>
    </form>

<%@ include file="components/bodyfinal.jsp"%>