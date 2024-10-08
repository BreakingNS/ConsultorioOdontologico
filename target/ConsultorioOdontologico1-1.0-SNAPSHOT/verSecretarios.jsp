<%@page import="logica.Secretario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Odontologo"%>
<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Ver Secretarios</h1>
        <p class="mb-4">A continuacion podrá visualizar la lista completa de secretarios.</p>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Secretarios</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>DNI</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Telefono</th>
                                <th>Direccion</th>
                                <th>Fecha Nacimiento</th>
                                <th>Sector</th>
                                <th>Usuario</th>
                                <th style="width: 210px">Acción</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Id</th>
                                <th>DNI</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Telefono</th>
                                <th>Direccion</th>
                                <th>Fecha Nacimiento</th>
                                <th>Sector</th>
                                <th>Usuario</th>
                                <th style="width: 210px">Acción</th>
                            </tr>
                        </tfoot>
                        
                        <%
                            List<Secretario> listaSecretarios = (List) request.getSession().getAttribute("listaSecretarios");
                            SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
                        %>
                        
                        <tbody>
                            <% for (Secretario secre : listaSecretarios){
                                String fechaFormateada = format.format(secre.getFecha_nac());
                            %>
                            <tr>
                                <td><%=secre.getId()%></td>
                                <td><%=secre.getDni()%></td>
                                <td><%=secre.getNombre()%></td>
                                <td><%=secre.getApellido()%></td>
                                <td><%=secre.getTelefono()%></td>
                                <td><%=secre.getDireccion()%></td>
                                <td><%=fechaFormateada%></td>
                                <td><%=secre.getSector()%></td>
                                <%
                                    String nombreUsuario = "NO ASIGNADO"; // Valor predeterminado

                                    if(secre.getUnUsuario() != null){
                                        nombreUsuario = secre.getUnUsuario().getNombre_usuario();
                                    }
                                %>

                                <td><%=nombreUsuario%></td>                              
                                                            
                                <td style="display: flex; width: 230px;">
                                    <form name="eliminar" action="SvElimSecretarios" method="POST"> <!-- esto es para mandar el codigo al servlet -->
                                        <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color:red; margin-right: 5px; "> 
                                            <i class="fa fa-trash-alt"></i> Eliminar
                                        </button>
                                        <input type="hidden" name="id" value="<%=secre.getId()%>"> <!-- esto es para mandar el codigo al servlet -->
                                    </form>
                                    <form name="editar" action="SvEditSecretarios" method="GET"> <!-- esto es para mandar el codigo al servlet --> 
                                        <button type="submit" class="btn btn-primary btn-user btn-block"; style="margin-left: 5px;">
                                                <i class="fa fa-pencil-alt"></i> Editar
                                        </button>
                                        <input type="hidden" name="id" value="<%=secre.getId()%>"> <!-- esto es para mandar el codigo al servlet -->
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
