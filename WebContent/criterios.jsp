<%@ page import="dao.CriterioEvaluacionDAO, dao.ResultadoAprendizajeDAO, dao.AsignaturaDAO, model.*, java.util.List" %>
    <%@ include file="inc/header.jsp" %>

        <% String raIdStr=request.getParameter("raId"); if (raIdStr==null) { response.sendRedirect("asignaturas.jsp");
            return; } int raId=Integer.parseInt(raIdStr); ResultadoAprendizajeDAO raDao=new ResultadoAprendizajeDAO();
            ResultadoAprendizaje ra=raDao.obtenerPorId(raId); AsignaturaDAO asignaturaDao=new AsignaturaDAO();
            Asignatura asignatura=asignaturaDao.obtenerPorId(ra.getAsignaturaId()); CriterioEvaluacionDAO dao=new
            CriterioEvaluacionDAO(); List<CriterioEvaluacion> criterios = dao.listarPorRA(raId);
            %>

            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="asignaturas.jsp">Asignaturas</a></li>
                    <li class="breadcrumb-item"><a href="resultados.jsp?asignaturaId=<%= asignatura.getId() %>">RAs de
                            <%= asignatura.getCodigo() %></a></li>
                    <li class="breadcrumb-item active" aria-current="page">Criterios</li>
                </ol>
            </nav>

            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="card-title">Resultado de Aprendizaje</h5>
                    <p class="card-text">
                        <%= ra.getDescripcion() %>
                    </p>
                </div>
            </div>

            <div class="d-flex justify-content-between align-items-center mb-3">
                <h3>Criterios de Evaluación</h3>
                <a href="formCriterio.jsp?raId=<%= raId %>" class="btn btn-primary"><i class="bi bi-plus-lg"></i> Nuevo
                    Criterio</a>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Descripción</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (CriterioEvaluacion ce : criterios) { %>
                            <tr>
                                <td>
                                    <%= ce.getId() %>
                                </td>
                                <td>
                                    <%= ce.getDescripcion() %>
                                </td>
                                <td>
                                    <a href="formCriterio.jsp?id=<%= ce.getId() %>&raId=<%= raId %>"
                                        class="btn btn-warning btn-sm" title="Editar">
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <a href="accionesCriterio.jsp?accion=eliminar&id=<%= ce.getId() %>&raId=<%= raId %>"
                                        class="btn btn-danger btn-sm" onclick="return confirm('¿Eliminar criterio?');"
                                        title="Eliminar">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </td>
                            </tr>
                            <% } %>
                                <% if(criterios.isEmpty()) { %>
                                    <tr>
                                        <td colspan="3" class="text-center">No hay criterios definidos.</td>
                                    </tr>
                                    <% } %>
                    </tbody>
                </table>
            </div>

            <%@ include file="inc/footer.jsp" %>