<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<h1>Alta Responsables</h1>
<p>Este es el apartado para dar de alta a los responsables de los pacientes menores de edad</p>

    <form class="user" action="SvResponsables" method="POST">
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
            <!-- Tipo Responsabilidad -->
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id="tipoResp" name="tipoResp"
                    placeholder="Tipo de Responsabilidad">
            </div>
        </div>
        
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Crear Responsable
        </button>
    </form>

<%@ include file="components/bodyfinal.jsp"%>