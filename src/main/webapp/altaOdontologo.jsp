<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="logica.ControladoraLogica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<h1>Alta Odontólogos</h1>

    <form class="user" action="SvOdontologos" method="POST">
        
        <%
            ControladoraLogica control = new ControladoraLogica();
            List<Usuario> listaUsuarios = control.traerUsuarios();
        %>
        
        <div class="form-group col">
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="dni" name="dni"
                    placeholder="DNI">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="nombre" name="nombre"
                    placeholder="Nombre">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="apellido" name="apellido"
                    placeholder="Apellido">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="telefono" name="telefono"
                    placeholder="Teléfono">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="direccion" name="direccion"
                    placeholder="Dirección">
            </div>
            <div class="col-sm-6 mb-3">
                Fecha de Nacimiento
                <br>
                <input type="date" class="form-control form-control-user" id="fechanac" name="fechanac"
                    placeholder="Fecha de Nacimiento">
            </div>
            <div class="col-sm-6 mb-3">
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
            </div>
            <div class="col-sm-6 mb-3">
                Usuarios
                <select id="usuario" name="usuario">
                    <option value="-">-</option>
                    <%for(Usuario usu : listaUsuarios){
                        if(usu.getRol().equals("Odontologo/a") && usu.isDispo() != false){
                        %> 
                        <option value="<%=usu.getId_usuario()%>"><%=usu.getNombre_usuario()%></option>
                        <%
                        }
                    }
                    %>
                </select>
            </div>
            <div class="col-sm-6 mb-3">
                
                <!-- Dias Laborales -->
                Dias de Atención<br><br>
                <input type="checkbox" id="diaLunes" name="dias" value="Lunes">
                <label for="aceptar">Lunes</label><br>
                <input type="checkbox" id="diaMartes" name="dias" value="Martes">
                <label for="aceptar">Martes</label><br>
                <input type="checkbox" id="diaMiercoles" name="dias" value="Miercoles">
                <label for="aceptar">Miercoles</label><br>
                <input type="checkbox" id="diaJueves" name="dias" value="Jueves">
                <label for="aceptar">Jueves</label><br>
                <input type="checkbox" id="diaViernes" name="dias" value="Viernes">
                <label for="aceptar">Viernes</label><br>
            </div>
            <div class="col-sm-6 mb-3">
                Hora de Entrada
                <select id="horaIni" name="horaIni">
                    <option value="-">-</option>
                    <option value='08:00'>8:00</option>
                    <option value='08:30'>8:30</option>
                    <option value='09:00'>9:00</option>
                    <option value='09:30'>9:30</option>
                    <option value='10:00'>10:00</option>
                    <option value='10:30'>10:30</option>
                    <option value='11:00'>11:00</option>
                    <option value='11:30'>11:30</option>
                </select>
            </div>
            <div class="col-sm-6 mb-3">
                Hora de Salida
                <select id="horaFin" name="horaFin">
                    <option value="-">-</option>
                    <option value='13:00'>13:00</option>
                    <option value='13:30'>13:30</option>
                    <option value='14:00'>14:00</option>
                    <option value='14:30'>14:30</option>
                    <option value='15:00'>15:00</option>
                    <option value='15:30'>15:30</option>
                    <option value='16:00'>16:00</option>
                </select>
            </div>
            <div class="col-sm-6 mb-3">
                Tiempo de cada Turno
                <select id="tiempoTurno" name="tiempoTurno">
                    <option value="-">-</option>
                    <option value='15'>15min</option>
                    <option value='30'>30min</option>
                </select>
            </div>
        </div>
        
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Crear Odontólogo
        </button>
    </form>

<%@ include file="components/bodyfinal.jsp"%>
