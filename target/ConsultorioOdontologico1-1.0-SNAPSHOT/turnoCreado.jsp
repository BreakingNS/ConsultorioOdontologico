<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Turno"%>
<%@page import="logica.Odontologo"%>
<%@page import="logica.Paciente"%>
<%@page import="java.util.List"%>
<%@page import="logica.ControladoraLogica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<%
    Turno turnoNuevo = (Turno)request.getSession().getAttribute("turnoCreado");
%>

<title>Turno Reservado</title>

<h1>Turno Reservado</h1>
<p>Su turno se creo de manera exitosa!</p>

<form class="user" action="index.jsp" method="POST">
    <div class="form-row align-items-center">
        <div class="col-auto mb-3">
            <p>Paciente </p>
            <p>Apellido: <%=turnoNuevo.getPacien().getApellido()%></p>
            <p>Nombre: <%=turnoNuevo.getPacien().getNombre()%></p>
            <p>Dni: <%=turnoNuevo.getPacien().getDni()%></p>
            <p>ObraSocial: <%=turnoNuevo.getPacien().getTiene_OS()%></p>
            <p>Especialista: <%=turnoNuevo.getOdonto().getEspecialidad()%></p>
            <p>Odontologo: <%=turnoNuevo.getOdonto().getApellido()%> <%=turnoNuevo.getOdonto().getNombre()%></p>
            <%
                SimpleDateFormat sdf = new SimpleDateFormat("EEEE dd-MM-yyyy");
                String fechaFormateada = sdf.format(turnoNuevo.getFecha_turno());
            %>
            <p>Fecha Turno: <%=fechaFormateada%></p>
            <p>Hora Turno: <%=turnoNuevo.getHora_turno()%></p>  
            
            <button class="btn btn-primary" type="submit">
                Volver al Inicio
            </button>
        </div>
    </div>
</form>


<%@ include file="components/bodyfinal.jsp"%>
