<%@page import="java.text.SimpleDateFormat"%>
<%@page import="logica.Paciente"%>
<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ include file="components/header.jsp"%>
<%@ include file="components/bodyprimeraparte.jsp"%>

<!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Ver Pacientes</h1>
        <p class="mb-4">A continuacion podrá visualizar la lista completa de pacientes</p>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Pacientes</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>DNI</th>
                                
                                <th>Fecha Nacimiento</th>
                                
                                <th>Dirección</th>
                                <th>Telefono</th>
                                
                                <th>Tipo Sangre</th>
                                
                                <th>Tiene Obra Social</th>
                                <th>Responsable</th>
                                <th style="width: 210px">Acción</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Id</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>DNI</th>
                                
                                <th>Fecha Nacimiento</th>
                                
                                <th>Dirección</th>
                                <th>Telefono</th>
                                
                                <th>Tipo Sangre</th>
                                
                                <th>Tiene Obra Social</th>
                                <th>Responsable</th>
                                <th style="width: 210px">Acción</th>
                            </tr>
                        </tfoot>
                        
                        <%
                            List<Paciente> listaPacientes = (List) request.getSession().getAttribute("listaPacientes");
                            SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
                        %>
                        
                        <tbody>
                            <% 
                                for (Paciente pac : listaPacientes){
                                    String fechaFormateada = format.format(pac.getFecha_nac());
                                    String nombreResponsable = "";
                                    if(pac.getUnResponsable() != null && pac.getUnResponsable().getNombre() != null){
                                        nombreResponsable = pac.getUnResponsable().getNombre() + " " + pac.getUnResponsable().getApellido();
                                    }
                                        
                            %>
                            <tr>
                                <td><%=pac.getId()%></td>
                                <td><%=pac.getNombre()%></td>
                                <td><%=pac.getApellido()%></td>
                                <td><%=pac.getDni()%></td>
                                
                                <td><%=fechaFormateada%></td>
                                
                                <td><%=pac.getDireccion()%></td>
                                <td><%=pac.getTelefono()%></td>
                                
                                <td><%=pac.getTipo_sangre()%></td>
                                
                                <td><%=pac.getTiene_OS()%></td>
                                <td><%=nombreResponsable%></td>
                                <td style="display: flex; width: 230px;">
                                    <form name="eliminar" action="SvElimPacientes" method="POST"> <!-- esto es para mandar el codigo al servlet -->
                                        <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color:red; margin-right: 5px; "> 
                                            <i class="fa fa-trash-alt"></i> Eliminar
                                        </button>
                                        <input type="hidden" name="id" value="<%=pac.getId()%>"> <!-- esto es para mandar el codigo al servlet -->
                                    </form>
                                    <form name="editar" action="SvEditPacientes" method="GET"> <!-- esto es para mandar el codigo al servlet --> 
                                        <button type="submit" class="btn btn-primary btn-user btn-block"; style="margin-left: 5px;">
                                                <i class="fa fa-pencil-alt"></i> Editar
                                        </button>
                                        <input type="hidden" name="id" value="<%=pac.getId()%>"> <!-- esto es para mandar el codigo al servlet -->
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
