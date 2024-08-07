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
        <h1 class="h3 mb-2 text-gray-800">Ver Odontologo</h1>
        <p class="mb-4">A continuacion podrá visualizar la lista completa de odontologos.</p>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Odontologos</h6>
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
                                <th>Especialidad</th>
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
                                <th>Especialidad</th>
                                <th>Usuario</th>
                                <th style="width: 210px">Acción</th>
                            </tr>
                        </tfoot>
                        
                        <%
                            List<Odontologo> listaOdontologos = (List) request.getSession().getAttribute("listaOdontologos");
                            SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
                        %>
                        
                        <tbody>
                            <% for (Odontologo odonto : listaOdontologos){
                                String fechaFormateada = format.format(odonto.getFecha_nac());
                            %>
                            <tr>
                                <td><%=odonto.getId()%></td>
                                <td><%=odonto.getDni()%></td>
                                <td><%=odonto.getNombre()%></td>
                                <td><%=odonto.getApellido()%></td>
                                <td><%=odonto.getTelefono()%></td>
                                <td><%=odonto.getDireccion()%></td>
                                <td><%=fechaFormateada%></td>
                                <td><%=odonto.getEspecialidad()%></td>
                                <%
                                    String nombreUsuario = "NO ASIGNADO"; // Valor predeterminado

                                    if(odonto.getUnUsuario() != null){
                                        nombreUsuario = odonto.getUnUsuario().getNombre_usuario();
                                    }
                                %>

                                <td><%=nombreUsuario%></td>                              
                                                            
                                <td style="display: flex; width: 230px;">
                                    <form name="eliminar" action="SvElimOdontologos" method="POST"> <!-- esto es para mandar el codigo al servlet -->
                                        <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color:red; margin-right: 5px; "> 
                                            <i class="fa fa-trash-alt"></i> Eliminar
                                        </button>
                                        <input type="hidden" name="id" value="<%=odonto.getId()%>"> <!-- esto es para mandar el codigo al servlet -->
                                    </form>
                                    <form name="editar" action="SvEditOdontologos" method="GET"> <!-- esto es para mandar el codigo al servlet --> 
                                        <button type="submit" class="btn btn-primary btn-user btn-block"; style="margin-left: 5px;">
                                                <i class="fa fa-pencil-alt"></i> Editar
                                        </button>
                                        <input type="hidden" name="id" value="<%=odonto.getId()%>"> <!-- esto es para mandar el codigo al servlet -->
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
