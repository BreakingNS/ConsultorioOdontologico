<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="logica.Usuario"%>
<%@page import="logica.Odontologo"%>
<%@page import="logica.ControladoraLogica"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Paciente"%>
<%@page import="logica.conversorHexaATexto"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<h1>Modificar Odontologo</h1>
<p>Este es el apartado para modificar un odontologo</p>

<% 
    Odontologo odonto = (Odontologo)request.getSession().getAttribute("odontoEditar");
    
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    String fechaNacFormateada = (odonto != null && odonto.getFecha_nac() != null) ? format.format(odonto.getFecha_nac()) : "";
    
    ControladoraLogica control = new ControladoraLogica();
    List<Usuario> listaUsuarios = control.traerUsuarios();
    
    int idUsuario;
    Usuario usuEdit = null;
    
    if(odonto.getUnUsuario() != null){
        idUsuario = odonto.getUnUsuario().getId_usuario();
        usuEdit = control.traerUsuario(idUsuario);
    }
    
    // Supongamos que diasAtencionStr es la cadena hexadecimal recuperada
    String diasAtencionStr = odonto.getUnHorario().getDiasAtencion();

    // Convertir la cadena hexadecimal a bytes
    byte[] bytes = conversorHexaATexto.hexStringToByteArray(diasAtencionStr);

    // Convertir los bytes a la cadena original
    String decodedString = new String(bytes, StandardCharsets.UTF_8);

    // Convertir la cadena decodificada en una lista
    List<String> diasAtencion = Arrays.asList(decodedString.split(","));

    for (String dia : diasAtencion) {
        System.out.println(dia);
    }
%>

    <form class="user" action="SvEditOdontologos" method="POST">
        <div class="form-group col">
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="dni" name="dni"
                    placeholder="DNI" value="<%=odonto.getDni()%>">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="nombre" name="nombre"
                    placeholder="Nombre" value="<%=odonto.getNombre()%>">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="apellido" name="apellido"
                    placeholder="Apellido" value="<%=odonto.getApellido()%>">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="telefono" name="telefono"
                    placeholder="Teléfono" value="<%=odonto.getTelefono()%>">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="direccion" name="direccion"
                    placeholder="Dirección" value="<%=odonto.getDireccion()%>">
            </div>
            <div class="col-sm-6 mb-3">
                Fecha de Nacimiento
                <br>
                <input type="date" class="form-control form-control-user" id="fechanac" name="fechanac"
                       placeholder="Fecha de Nacimiento" value="<%=fechaNacFormateada %>">
            </div>
            <div class="col-sm-6 mb-3">
                Especialidad
                <select id="especialidadSelect" name="especialidad" onchange="document.getElementById('especialidadForm').submit();">
                    <option value="-">-</option>
                    <option value="ortodoncia" <%= "ortodoncia".equals(odonto.getEspecialidad()) ? "selected" : "" %>>Ortodoncia</option>
                    <option value="periodoncia" <%= "periodoncia".equals(odonto.getEspecialidad()) ? "selected" : "" %>>Periodoncia</option>
                    <option value="endodoncia" <%= "endodoncia".equals(odonto.getEspecialidad()) ? "selected" : "" %>>Endodoncia</option>
                    <option value="odontopediatria" <%= "odontopediatria".equals(odonto.getEspecialidad()) ? "selected" : "" %>>Odontopediatría</option>
                    <option value="prostodoncia" <%= "prostodoncia".equals(odonto.getEspecialidad()) ? "selected" : "" %>>Prostodoncia</option>
                    <option value="cirugiaoralmaxilar" <%= "cirugiaoralmaxilar".equals(odonto.getEspecialidad()) ? "selected" : "" %>>Cirugía Oral y Maxilofacial</option>
                    <option value="estetica" <%= "estetica".equals(odonto.getEspecialidad()) ? "selected" : "" %>>Odontología Estética</option>
                    <option value="preventiva" <%= "preventiva".equals(odonto.getEspecialidad()) ? "selected" : "" %>>Odontología Preventiva</option>
                </select>
            </div>
            <div class="col-sm-6 mb-3">
                Usuarios
                <select id="usuario" name="usuario">
                    <option value="-">-</option>
                    <%for(Usuario usu : listaUsuarios){
                        if(usu.getRol().equals("Odontologo/a") && usu.isDispo() != false){
                        %> 
                        <option value="<%=usu.getId_usuario()%>" <%=usu.getId_usuario() == odonto.getUnUsuario().getId_usuario() ? "selected" : "" %>><%=usu.getNombre_usuario()%></option>
                        <%
                        }
                    }
                    %>
                </select>
            </div>
            <div class="col-sm-6 mb-3">
                Dias de Atención<br><br>
                <input type="checkbox" id="diaLunes" name="dias" value="Lunes" <%= diasAtencion.contains("Lunes") ? "checked" : "" %>>
                <label for="diaLunes">Lunes</label><br>
                <input type="checkbox" id="diaMartes" name="dias" value="Martes" <%= diasAtencion.contains("Martes") ? "checked" : "" %>>
                <label for="diaMartes">Martes</label><br>
                <input type="checkbox" id="diaMiercoles" name="dias" value="Miercoles" <%= diasAtencion.contains("Miercoles") ? "checked" : "" %>>
                <label for="diaMiercoles">Miercoles</label><br>
                <input type="checkbox" id="diaJueves" name="dias" value="Jueves" <%= diasAtencion.contains("Jueves") ? "checked" : "" %>>
                <label for="diaJueves">Jueves</label><br>
                <input type="checkbox" id="diaViernes" name="dias" value="Viernes" <%= diasAtencion.contains("Viernes") ? "checked" : "" %>>
                <label for="diaViernes">Viernes</label><br>
            </div>

            <div class="col-sm-6 mb-3">
                Hora de Entrada
                <select id="horaIni" name="horaIni">
                    <option value="-">-</option>
                    <option value='08:00' <%= "8:00".equals(odonto.getUnHorario().getHorario_inicio()) ? "selected" : "" %>>8:00</option>
                    <option value='08:30' <%= "8:30".equals(odonto.getUnHorario().getHorario_inicio()) ? "selected" : "" %>>8:30</option>
                    <option value='09:00' <%= "9:00".equals(odonto.getUnHorario().getHorario_inicio()) ? "selected" : "" %>>9:00</option>
                    <option value='09:30' <%= "9:30".equals(odonto.getUnHorario().getHorario_inicio()) ? "selected" : "" %>>9:30</option>
                    <option value='10:00' <%= "10:00".equals(odonto.getUnHorario().getHorario_inicio()) ? "selected" : "" %>>10:00</option>
                    <option value='10:30' <%= "10:30".equals(odonto.getUnHorario().getHorario_inicio()) ? "selected" : "" %>>10:30</option>
                    <option value='11:00' <%= "11:00".equals(odonto.getUnHorario().getHorario_inicio()) ? "selected" : "" %>>11:00</option>
                    <option value='11:30' <%= "11:30".equals(odonto.getUnHorario().getHorario_inicio()) ? "selected" : "" %>>11:30</option>
                </select>
            </div>
            <div class="col-sm-6 mb-3">
                Hora de Salida
                <select id="horaFin" name="horaFin">
                    <option value="-">-</option>
                    <option value='13:00' <%= "13:00".equals(odonto.getUnHorario().getHorario_fin()) ? "selected" : "" %>>13:00</option>
                    <option value='13:30' <%= "13:30".equals(odonto.getUnHorario().getHorario_fin()) ? "selected" : "" %>>13:30</option>
                    <option value='14:00' <%= "14:00".equals(odonto.getUnHorario().getHorario_fin()) ? "selected" : "" %>>14:00</option>
                    <option value='14:30' <%= "14:30".equals(odonto.getUnHorario().getHorario_fin()) ? "selected" : "" %>>14:30</option>
                    <option value='15:00' <%= "15:00".equals(odonto.getUnHorario().getHorario_fin()) ? "selected" : "" %>>15:00</option>
                    <option value='15:30' <%= "15:30".equals(odonto.getUnHorario().getHorario_fin()) ? "selected" : "" %>>15:30</option>
                    <option value='16:00' <%= "16:00".equals(odonto.getUnHorario().getHorario_fin()) ? "selected" : "" %>>16:00</option>
                </select>
            </div>
            <div class="col-sm-6 mb-3">
                Tiempo de cada Turno
                <select id="tiempoTurno" name="tiempoTurno">
                    <option value="-">-</option>
                    <option value='15' <%= 15 == odonto.getUnHorario().getDuracionTurnoMinutos() ? "selected" : "" %>>15min</option>
                    <option value='30' <%= 30 == odonto.getUnHorario().getDuracionTurnoMinutos() ? "selected" : "" %>>30min</option>
                </select>
            </div>
                
            <!-- Acá va a ir todo lo que respecta a horarios y usuarios-->
        </div>
        
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Modificar Odontólogo
        </button>
    </form>

<%@ include file="components/bodyfinal.jsp"%>
