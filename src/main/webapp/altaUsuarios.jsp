<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<h1>Alta Usuarios</h1>
<p>Este es el apartado para dar de alta a los usuarios</p>

<form class="user" action="SvUsuarios" method="POST" onsubmit="return validateForm()">
    <div class="form-group col">
        <div class="col-sm-6 mb-3">
            <input type="text" class="form-control form-control-user" id="nombreusu" name="nombreusu"
                   placeholder="Nombre Usuario">
            <span id="nombreusu-error" style="color: red; display: none;">Campo vacío</span>
        </div>
        <div class="col-sm-6 mb-3">
            <input type="password" class="form-control form-control-user" id="constrasenia" name="constrasenia"
                   placeholder="Contraseña">
            <span id="constrasenia-error" style="color: red; display: none;">Campo vacío</span>
        </div>
        Rol
        <select id="rol" name="rol">
            <option value="-">-</option>
            <option value="Secretario/a">Secretario/a</option>
            <option value="Odontologo/a">Odontólogo/a</option>
        </select>
        <span id="rol-error" style="color: red; display: none;">Seleccione un rol</span>
        
        <!-- Acá va a ir todo lo que respecta a horarios y usuarios-->
    </div>
    
    <button class="btn btn-primary btn-user btn-block" type="submit">
        Crear Usuario
    </button>
</form>

<%@ include file="components/bodyfinal.jsp"%>

<script>
    function validateForm() {
        var isValid = true;

        var nombreUsu = document.getElementById("nombreusu");
        var contrasenia = document.getElementById("constrasenia");
        var rol = document.getElementById("rol");

        // Validar Nombre Usuario
        if (nombreUsu.value.trim() === "") {
            document.getElementById("nombreusu-error").style.display = "block";
            isValid = false;
        } else {
            document.getElementById("nombreusu-error").style.display = "none";
        }

        // Validar Contraseña
        if (contrasenia.value.trim() === "") {
            document.getElementById("constrasenia-error").style.display = "block";
            isValid = false;
        } else {
            document.getElementById("constrasenia-error").style.display = "none";
        }

        // Validar Rol
        if (rol.value === "-") {
            document.getElementById("rol-error").style.display = "block";
            isValid = false;
        } else {
            document.getElementById("rol-error").style.display = "none";
        }

        // Confirmar acción
        if (isValid) {
            return confirm("¿Está seguro que desea crear este usuario?");
        }

        return isValid;
    }
</script>

