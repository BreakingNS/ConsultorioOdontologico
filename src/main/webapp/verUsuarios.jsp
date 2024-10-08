<%@page import="logica.Usuario"%>
<%@page import="logica.ControladoraLogica"%>
<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Ver Usuarios</h1>
        <p class="mb-4">A continuacion podrá visualizar la lista completa de usuarios</p>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Usuarios</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Nomber de Usuario</th>
                                <th>Disponible</th>
                                <th>Rol</th>
                                <th style="width: 210px">Acción</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Id</th>
                                <th>Nomber de Usuario</th>
                                <th>Disponible</th>
                                <th>Rol</th>
                                <th style="width: 210px">Acción</th>
                            </tr>
                        </tfoot>
                        
                        <%
                            List<Usuario> listaUsuarios = (List) request.getSession().getAttribute("listaUsuarios");
                        %>
                        
                        <tbody>
                            <% for (Usuario usu : listaUsuarios){%>
                            <tr>
                                <td><%=usu.getId_usuario()%></td>
                                <td><%=usu.getNombre_usuario()%></td>
                                
                                <td><%= usu.isDispo() == true ? "Si" : "No" %></td>
                                <td><%=usu.getRol()%></td>
                            
                                <td style="display: flex; width: 230px;">
                                    <form name="eliminar" action="SvElimUsuarios" method="POST" onsubmit="return confirmarEliminar()"> <!-- esto es para mandar el codigo al servlet -->
                                        <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color:red; margin-right: 5px; "> 
                                            <i class="fa fa-trash-alt"></i> Eliminar
                                        </button>
                                        <input type="hidden" name="id" value="<%=usu.getId_usuario()%>"> <!-- esto es para mandar el codigo al servlet -->
                                    </form>
                                    <form name="editar" action="SvEditUsuarios" method="GET"> <!-- esto es para mandar el codigo al servlet --> 
                                        <button type="submit" class="btn btn-primary btn-user btn-block"; style="margin-left: 5px;">
                                                <i class="fa fa-pencil-alt"></i> Editar
                                        </button>
                                        <input type="hidden" name="id" value="<%=usu.getId_usuario()%>"> <!-- esto es para mandar el codigo al servlet -->
                                    </form>
                                </td>
                            
                            
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>

<%@ include file="components/bodyfinal.jsp"%>

<script>
    function confirmarEliminar(){
        var esValido = true;
        
        if(esValido){
            return confirm("¿Está seguro que desea eliminar el usuario?");    
        }
        
        return esValido;
    }
</script>