<%@ page
    import="dao.ResultadoAprendizajeDAO, dao.AsignaturaDAO, model.ResultadoAprendizaje, model.Asignatura, java.util.List"
    %>
    <%@ include file="inc/header.jsp" %>

        <% String asigIdStr=request.getParameter("asignaturaId"); if (asigIdStr==null) {
            response.sendRedirect("asignaturas.jsp"); return; } int asignaturaId=Integer.parseInt(asigIdStr);
            AsignaturaDAO asignaturaDao=new AsignaturaDAO(); Asignatura
            asignatura=asignaturaDao.obtenerPorId(asignaturaId); ResultadoAprendizajeDAO dao=new
            ResultadoAprendizajeDAO(); List<ResultadoAprendizaje> ras = dao.listarPorAsignatura(asignaturaId);
            %>

            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="asignaturas.jsp">Asignaturas</a></li>
                    <li class="breadcrumb-item active" aria-current="page">RAs de <%= asignatura.getNombre() %>
                    </li>
                </ol>
            </nav>

            <div class="d-flex justify-content-between align-items-center mb-3">
                <h3>Resultados de Aprendizaje: <%= asignatura.getCodigo() %>
                </h3>
                <a href="formResultado.jsp?asignaturaId=<%= asignaturaId %>" class="btn btn-primary"><i
                        class="bi bi-plus-lg"></i> Nuevo RA</a>
            </div>

            <div class="table-responsive">
                <table class="table table-striped">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Descripción</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (ResultadoAprendizaje ra : ras) { %>
                            <tr>
                                <td>
                                    <%= ra.getId() %>
                                </td>
                                <td>
                                    <%= ra.getDescripcion() %>
                                </td>
                                <td>
                                    <a href="criterios.jsp?raId=<%= ra.getId() %>"
                                        class="btn btn-info btn-sm text-white" title="Ver Criterios">
                                        <i class="bi bi-list-task"></i> Criterios
                                    </a>
                                    <a href="formResultado.jsp?id=<%= ra.getId() %>&asignaturaId=<%= asignaturaId %>"
                                        class="btn btn-warning btn-sm" title="Editar">
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <a href="accionesResultado.jsp?accion=eliminar&id=<%= ra.getId() %>&asignaturaId=<%= asignaturaId %>"
                                        class="btn btn-danger btn-sm"
                                        onclick="return confirm('¿Eliminar RA? Esto borrará sus criterios asociados.');"
                                        title="Eliminar">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </td>
                            </tr>
                            <% } %>
                                <% if(ras.isEmpty()) { %>
                                    <tr>
                                        <td colspan="3" class="text-center">No hay resultados de aprendizaje registrados
                                            para esta asignatura.</td>
                                    </tr>
                                    <% } %>
                    </tbody>
                </table>
            </div>

            <%@ include file="inc/footer.jsp" %>