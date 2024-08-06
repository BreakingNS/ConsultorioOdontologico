<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="logica.Odontologo"%>
<%@page import="logica.Paciente"%>
<%@page import="java.util.List"%>
<%@page import="logica.ControladoraLogica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<%
    Paciente paciente = (Paciente)session.getAttribute("pacienteSelected");
    
    String dniPac = (String)session.getAttribute("dniSelected");
    String dni = paciente.getDni();
    String apellido = paciente.getApellido();
    String nombre = paciente.getNombre();
    Date fecha_nac = paciente.getFecha_nac();
    Boolean tieneOS = paciente.getTiene_OS();
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

<p>DNI: <%=dni%></p>
<p>Apellido: <%=apellido%></p>
<p>Nombre: <%=nombre%></p>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
    String fechaFormateada = sdf.format(paciente.getFecha_nac());
%>
<p>Fecha de Nacimiento: <%=fechaFormateada%></p>
<p>Tiene Obra Social: <%= tieneOS.equals(true) ? "Si" : "No" %></p>

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
