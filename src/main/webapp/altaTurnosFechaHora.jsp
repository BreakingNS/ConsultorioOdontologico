<%@page import="logica.Odontologo"%>
<%@page import="logica.Paciente"%>
<%@page import="java.util.List"%>
<%@page import="logica.ControladoraLogica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<title>Reserva de Turnos</title>

<%
    ControladoraLogica control = new ControladoraLogica();
    String especialidad = (String)request.getSession().getAttribute("especialidadSelected");
    List<Odontologo> listaOdontologos = (List<Odontologo>)request.getSession().getAttribute("odontoFiltrados");
%>

<h1>Alta Turnos</h1>
<p>Este es el apartado para dar de alta los turnos de los pacientes.</p>

<form id="especialidad" action="SvFiltrarOdontologos" method="POST">
    Especialidad
    <select id="especialidadSelect" name="especialidad" onchange="document.getElementById('especialidad').submit();">
        <option value="-" <%= "-".equals(especialidad) ? "selected" : "" %>>-</option>
        <option value="ortodoncia" <%= "ortodoncia".equals(especialidad) ? "selected" : "" %>>Ortodoncia</option>
        <option value="periodoncia" <%= "periodoncia".equals(especialidad) ? "selected" : "" %>>Periodoncia</option>
        <option value="endodoncia" <%= "endodoncia".equals(especialidad) ? "selected" : "" %>>Endodoncia</option>
        <option value="odontopediatria" <%= "odontopediatria".equals(especialidad) ? "selected" : "" %>>Odontopediatría</option>
        <option value="prostodoncia" <%= "prostodoncia".equals(especialidad) ? "selected" : "" %>>Prostodoncia</option>
        <option value="cirugiaoralmaxilar" <%= "cirugiaoralmaxilar".equals(especialidad) ? "selected" : "" %>>Cirugía Oral y Maxilofacial</option>
        <option value="estetica" <%= "estetica".equals(especialidad) ? "selected" : "" %>>Odontología Estética</option>
        <option value="preventiva" <%= "preventiva".equals(especialidad) ? "selected" : "" %>>Odontología Preventiva</option>
        <%System.out.println(especialidad);%>
    </select>
</form>

<br>
        
<%-- Este select será actualizado por el servlet --%>
<form id="odontologo" action="SvFiltrarFecha" method="POST">
    Odontólogo Especializado
    <select id="odontologoSelect" name="odontologo" onchange="document.getElementById('odontologo').submit();">
        <option value="-">-</option>
        <%
            if (listaOdontologos != null) {
                for (Odontologo odonto : listaOdontologos) {
                    out.println("<option value='" + odonto.getId() + "'>" + odonto.getApellido() + "</option>");
                }
            }
        %>
    </select>
</form>
        
<%@ include file="components/bodyfinal.jsp"%>
