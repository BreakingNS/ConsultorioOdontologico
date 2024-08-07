<%@page import="logica.Turno"%>
<%@page import="logica.ControladoraLogica"%>
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
        <h1 class="h3 mb-2 text-gray-800">Ver Turnos</h1>
        <p class="mb-4">A continuacion podrá visualizar la lista completa de turnos asignados.</p>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Turnos</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Id Turno</th>
                                <th>Profesional</th>
                                <th>Apellido Pac.</th>
                                <th>Nombre Pac.</th>
                                <th>DNI</th>
                                <th>Fecha Nac.</th>
                                <th>Obra Social</th>
                                <th>Dia Turno</th>
                                <th>Hora Turno</th>
                                <th style="width: 210px">Acción</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Id Turno</th>
                                <th>Profesional</th>
                                <th>Apellido Pac.</th>
                                <th>Nombre Pac.</th>
                                <th>DNI</th>
                                <th>Fecha Nac.</th>
                                <th>Obra Social</th>
                                <th>Dia Turno</th>
                                <th>Hora Turno</th>
                                <th style="width: 210px">Acción</th>
                            </tr>
                        </tfoot>
                        
                        <%
                            ControladoraLogica control = new ControladoraLogica();
                            
                            List<Turno> listaTurnos = control.getTurnos();
                            SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
                        %>
                        
                        <tbody>
                            <% 
                            for (Turno turno : listaTurnos){
                                if(turno.getDisponible()==false){
                                    String FFnacimiento = format.format(turno.getPacien().getFecha_nac());
                                    String FFturno = format.format(turno.getFecha_turno());
                            %>
                                <tr>
                                    <td><%= turno.getId_turno() %></td>
                                    <td><%= turno.getOdonto().getApellido() + " " + turno.getOdonto().getNombre() %></td>
                                    <td><%= turno.getPacien().getApellido() %></td>
                                    <td><%= turno.getPacien().getNombre() %></td>
                                    <td><%= turno.getPacien().getDni() %></td>
                                    <td><%= FFnacimiento %></td>
                                    <td><%= turno.getPacien().getTiene_OS() %></td>
                                    <td><%= FFturno %></td>
                                    <td><%= turno.getHora_turno() %></td>                              

                                    <td style="display: flex; width: 230px;">
                                        <form name="eliminar" action="SvElimOdontologos" method="POST"> <!-- esto es para mandar el codigo al servlet -->
                                            <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color:red; margin-right: 5px; "> 
                                                <i class="fa fa-trash-alt"></i> Eliminar
                                            </button>
                                            <input type="hidden" name="id" value="<%%>"> <!-- esto es para mandar el codigo al servlet -->
                                        </form>
                                        <form name="editar" action="SvEditOdontologos" method="GET"> <!-- esto es para mandar el codigo al servlet --> 
                                            <button type="submit" class="btn btn-primary btn-user btn-block"; style="margin-left: 5px;">
                                                    <i class="fa fa-pencil-alt"></i> Editar
                                            </button>
                                            <input type="hidden" name="id" value="<%%>"> <!-- esto es para mandar el codigo al servlet -->
                                        </form>
                                    </td>


                                </tr>
                            <%
                                }    
                            }
                            %>
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
