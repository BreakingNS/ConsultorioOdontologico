<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<h1>Modificar Paciente</h1>
<p>Este es el apartado para modificar un paciente</p>

<% 
    Paciente pac = (Paciente)request.getSession().getAttribute("pacEditar");
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    String fechaNacFormateada = (pac != null && pac.getFecha_nac() != null) ? format.format(pac.getFecha_nac()) : "";
    
    boolean tieneOS = (pac != null && pac.getTiene_OS() != null) ? pac.getTiene_OS() : false;

    String tipoSangre = (pac != null && pac.getTipo_sangre() != null) ? pac.getTipo_sangre() : "-";

    String responsableId = (pac != null && pac.getUnResponsable() != null) ? String.valueOf(pac.getUnResponsable().getId()) : "";
%>

    <form class="user" action="SvEditPacientes" method="POST">
        <div class="form-group col">
            <!-- DNI -->
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id="dni" name="dni"
                       placeholder="DNI" value="<%=pac.getDni()%>">
            </div>
            <!-- Nombre -->
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id="nombre" name="nombre"
                    placeholder="Nombre" value="<%=pac.getNombre()%>">
            </div>
            <!-- Apellido -->
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id="apellido" name="apellido"
                    placeholder="Apellido" value="<%=pac.getApellido()%>">
            </div>
            <!-- Direccion -->
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id="direccion" name="direccion"
                    placeholder="Dirección" value="<%=pac.getDireccion()%>">
            </div>
            <!-- Telefono -->
            <div class="col-sm-6 mb-3">
                <input type="number" class="form-control form-control-user" id="telefono" name="telefono"
                    placeholder="Telefono" value="<%=pac.getTelefono() %>">
            </div>
            
            <!-- Fecha de Nacimiento -->
            <div class="col-sm-6 mb-3">
                Fecha de Nacimiento
                <br>
                <input type="date" class="form-control form-control-user" id="fechanac" name="fechanac"
                       placeholder="Fecha de Nacimiento" value="<%= fechaNacFormateada %>">
            </div>

            <!-- Tiene OS -->
            <label for="aceptar">Tiene Obra Social</label>
            <input type="checkbox" id="osocial" name="osocial" value="true" value="true" <%= tieneOS ? "checked" : "" %>

            <input type="hidden" id="hiddenOsocial" name="osocial" value="false">

            <script>
                document.getElementById('osocial').addEventListener('change', function() {
                    document.getElementById('hiddenOsocial').disabled = this.checked;
                });
            </script>

            <!--
            <label for="aceptar">Tiene Obra Social</label>
            <input type="checkbox" id="osocial" name="osocial" value="no">
            -->
            
            <!-- Tipo de Sangre -->
            <br>
            Tipo de Sangre
            <select id="tiposan" name="tiposan">
                <option value="-" <%= "-".equals(tipoSangre) ? "selected" : "" %>>-</option>
                <option value="A+" <%= "A+".equals(tipoSangre) ? "selected" : "" %>>A+</option>
                <option value="A-" <%= "A-".equals(tipoSangre) ? "selected" : "" %>>A-</option>
                <option value="B+" <%= "B+".equals(tipoSangre) ? "selected" : "" %>>B+</option>
                <option value="B-" <%= "B-".equals(tipoSangre) ? "selected" : "" %>>B-</option>
                <option value="AB+" <%= "AB+".equals(tipoSangre) ? "selected" : "" %>>AB+</option>
                <option value="AB-" <%= "AB-".equals(tipoSangre) ? "selected" : "" %>>AB-</option>
                <option value="O+" <%= "O+".equals(tipoSangre) ? "selected" : "" %>>O+</option>
                <option value="O-" <%= "O-".equals(tipoSangre) ? "selected" : "" %>>O-</option>
            </select>
            <!-- UnResponsable -->
            <div class="col-sm-6 mb-3">
                <input type="number" class="form-control form-control-user" id="responsable" name="responsable" 
                       placeholder="Responsable" value="<%= responsableId %>">
            </div> 
            
            <!-- Acá va a ir todo lo que respecta a horarios y usuarios-->
        </div>
        
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Modificar Paciente
        </button>
    </form>

<%@ include file="components/bodyfinal.jsp"%>
