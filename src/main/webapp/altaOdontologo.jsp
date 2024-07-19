<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<h1>Alta Odontólogos</h1>
<p>Hola</p>

    <form class="user">
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
                <input type="text" class="form-control form-control-user" id ="fechanac" name="fechanac"
                    placeholder="Fecha Nac">
            </div>
            <div class="col-sm-6 mb-3">
                <input type="text" class="form-control form-control-user" id ="especialidad" name="especialidad"
                    placeholder="Especialidad">
            </div>
            <!-- Acá va a ir todo lo que respecta a horarios y usuarios-->
        </div>
        
        <button href="#" class="btn btn-primary btn-user btn-block">
            Crear Odontólogo
        </button>
    </form>

<%@ include file="components/bodyfinal.jsp"%>
