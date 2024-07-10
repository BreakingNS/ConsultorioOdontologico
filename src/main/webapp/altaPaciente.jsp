<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<h1>Alta Usuarios</h1>
<p>Este es el apartado para dar de alta a los usuarios</p>

    <form class="user" action="SvUsuarios" method="POST">
        <div class="form-group col">
            <!-- DNI -->
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id="dni" name="dni"
                    placeholder="DNI">
            </div>
            <!-- Nombre -->
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id="nombre" name="nombre"
                    placeholder="Nombre">
            </div>
            <!-- Apellido -->
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id="apellido" name="apellido"
                    placeholder="Apellido">
            </div>
            <!-- Direccion -->
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id="direccion" name="direccion"
                    placeholder="Dirección">
            </div>
            <!-- Telefono -->
            <div class="col-sm-6 mb-3">
                <input type="number" class="form-control form-control-user" id="telefono" name="telefono"
                    placeholder="Telefono">
            </div>
            <!-- Fecha de Nacimiento -->
            <div class="col-sm-6 mb-3">
                Fecha de Nacimiento
                <br>
                <input type="date" class="form-control form-control-user" id="fechanac" name="fechanac"
                    placeholder="Fecha de Nacimiento">
            </div>
            <!-- Tiene OS -->
            <label for="aceptar">Tiene Obra Social</label>
            <input type="checkbox" id="osocial" name="osocial" value="no">
                
            <!-- Tipo de Sangre -->
            <br>
            Tipo de Sangre
            <select id="opciones" name="opciones">
                
                <option value="-">-</option>
                <option value="a+">A+</option>
                <option value="a-">A-</option>
                <option value="b+">B+</option>
                <option value="b-">B-</option>
                <option value="ab+">AB+</option>
                <option value="ab-">AB-</option>
                <option value="o+">O+</option>
                <option value="o-">O-</option>
            </select>
            <!-- UnResponsable -->
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id="responsable" name="responsable"
                    placeholder="Responsable">
            </div>
            
            <!-- Acá va a ir todo lo que respecta a horarios y usuarios-->
        </div>
        
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Crear Paciente
        </button>
    </form>

<%@ include file="components/bodyfinal.jsp"%>


