<%@page import="logica.Odontologo"%>
<%@page import="logica.Paciente"%>
<%@page import="java.util.List"%>
<%@page import="logica.ControladoraLogica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<title>Reserva de Turnos</title>

<h1>Alta Turnos</h1>
<p>Este es el apartado para dar de alta los turnos de los pacientes.</p>

<form id="especialidadForm" action="SvFiltrarOdontologos" method="post">
    Especialidad
    <select id="especialidadSelect" name="especialidad" onchange="document.getElementById('especialidadForm').submit();">
        <option value="-">-</option>
        <option value="ortodoncia">Ortodoncia</option>
        <option value="periodoncia">Periodoncia</option>
        <option value="endodoncia">Endodoncia</option>
        <option value="odontopediatria">Odontopediatría</option>
        <option value="prostodoncia">Prostodoncia</option>
        <option value="cirugiaoralmaxilar">Cirugía Oral y Maxilofacial</option>
        <option value="estetica">Odontología Estética</option>
        <option value="preventiva">Odontología Preventiva</option>
    </select>
</form>

<%@ include file="components/bodyfinal.jsp"%>
