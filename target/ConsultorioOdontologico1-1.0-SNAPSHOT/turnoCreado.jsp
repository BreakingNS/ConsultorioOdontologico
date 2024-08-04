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

<title>Reserva de Turnos</title>

<h1>Alta Turnos</h1>
<p>Este es el apartado para dar de alta los turnos de los pacientes.</p>

<form class="user" action="SvBuscarPaciente" method="POST">
    <div class="form-row align-items-center">
        <div class="col-auto mb-3">
            <p>Paciente </p>
            <p>Apellido: <%=turnoNuevo.getPacien().getApellido()%></p>
            <p>Nombre: <%=turnoNuevo.getPacien().getNombre()%></p>
            <p>Dni: <%=turnoNuevo.getPacien().getDni()%></p>
            <p>ObraSocial: <%=turnoNuevo.getPacien().getTiene_OS()%></p>
            <p>Especialista: <%=turnoNuevo.getOdonto().getEspecialidad()%></p>
            <p>Odontologo: <%=turnoNuevo.getOdonto().getApellido()%> <%=turnoNuevo.getOdonto().getNombre()%></p>
            <p>Fecha Turno: <%=turnoNuevo.getFecha_turno()%></p>
            <p>Hora Turno: <%=turnoNuevo.getHora_turno()%></p>  
            
            <button class="btn btn-primary" type="submit">
                Volver al Inicio
            </button>
        </div>
    </div>
</form>


<%@ include file="components/bodyfinal.jsp"%>
