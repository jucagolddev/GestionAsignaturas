<%@ page import="dao.AsignaturaDAO, java.util.List, model.Asignatura" %>
    <%@ include file="inc/header.jsp" %>

        <% AsignaturaDAO dao=new AsignaturaDAO(); List<Asignatura> asignaturas = dao.listar();
            %>

            <div class="d-flex justify-content-between align-items-center mb-3">
                <h1>Gestión de Asignaturas</h1>
                <a href="formAsignatura.jsp" class="btn btn-primary"><i class="bi bi-plus-lg"></i> Nueva Asignatura</a>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Código</th>
                            <th>Nombre</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Asignatura a : asignaturas) { %>
                            <tr>
                                <td>
                                    <%= a.getId() %>
                                </td>
                                <td>
                                    <%= a.getCodigo() %>
                                </td>
                                <td>
                                    <%= a.getNombre() %>
                                </td>
                                <td>
                                    <a href="resultados.jsp?asignaturaId=<%= a.getId() %>"
                                        class="btn btn-info btn-sm text-white" title="Ver Resultados de Aprendizaje">
                                        <i class="bi bi-list-check"></i> RAs
                                    </a>
                                    <a href="formAsignatura.jsp?id=<%= a.getId() %>" class="btn btn-warning btn-sm"
                                        title="Editar">
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <a href="accionesAsignatura.jsp?accion=eliminar&id=<%= a.getId() %>"
                                        class="btn btn-danger btn-sm"
                                        onclick="return confirm('¿Estás seguro de eliminar esta asignatura? Se eliminarán también sus RAs y Criterios.');"
                                        title="Eliminar">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </td>
                            </tr>
                            <% } %>
                                <% if(asignaturas.isEmpty()) { %>
                                    <tr>
                                        <td colspan="4" class="text-center">No hay asignaturas registradas.</td>
                                    </tr>
                                    <% } %>
                    </tbody>
                </table>
            </div>

            <%@ include file="inc/footer.jsp" %>