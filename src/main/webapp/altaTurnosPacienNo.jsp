<%@page import="logica.Odontologo"%>
<%@page import="logica.Paciente"%>
<%@page import="java.util.List"%>
<%@page import="logica.ControladoraLogica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<%
    String dniPac = (String)session.getAttribute("dniSelected");
%>

<title>Reserva de Turnos</title>

<h1>Alta Turnos</h1>
<p>Este es el apartado para dar de alta los turnos de los pacientes.</p>

<form class="user" action="SvBuscarPaciente" method="POST">
    <div class="form-row align-items-center">
        <div class="col-auto mb-3">
            <input type="text" class="form-control form-control-user" id="dniPaciente" name="dniPaciente"
                   placeholder="DNI de Paciente" value="<%=dniPac%>">
        </div>
        <div class="col-auto mb-3">
            <button class="btn btn-primary" type="submit">
                Buscar Paciente
            </button>
        </div>
    </div>
</form>

<p>PACIENTE NO ENCONTRADO</p>

<%@ include file="components/bodyfinal.jsp"%>
