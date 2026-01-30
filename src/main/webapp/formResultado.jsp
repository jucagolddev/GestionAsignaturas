<%@ page import="dao.ResultadoAprendizajeDAO, model.ResultadoAprendizaje" %>
    <%@ include file="inc/header.jsp" %>

        <% String idStr=request.getParameter("id"); String asignaturaIdStr=request.getParameter("asignaturaId"); if
            (asignaturaIdStr==null) { response.sendRedirect("asignaturas.jsp"); return; } ResultadoAprendizaje ra=new
            ResultadoAprendizaje(); ra.setAsignaturaId(Integer.parseInt(asignaturaIdStr)); String
            titulo="Nuevo Resultado de Aprendizaje" ; String btnText="Guardar" ; if (idStr !=null && !idStr.isEmpty()) {
            ResultadoAprendizajeDAO dao=new ResultadoAprendizajeDAO(); ra=dao.obtenerPorId(Integer.parseInt(idStr)); if
            (ra !=null) { titulo="Editar Resultado de Aprendizaje" ; btnText="Actualizar" ; } } %>

            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header bg-info text-white">
                            <h4 class="mb-0">
                                <%= titulo %>
                            </h4>
                        </div>
                        <div class="card-body">
                            <form action="accionesResultado.jsp" method="post" class="needs-validation" novalidate>
                                <input type="hidden" name="accion" value="<%= (ra.getId() > 0) ? " editar" : "crear"
                                    %>">
                                <input type="hidden" name="asignaturaId" value="<%= ra.getAsignaturaId() %>">
                                <% if (ra.getId()> 0) { %>
                                    <input type="hidden" name="id" value="<%= ra.getId() %>">
                                    <% } %>

                                        <div class="mb-3">
                                            <label for="descripcion" class="form-label">Descripción</label>
                                            <textarea class="form-control" id="descripcion" name="descripcion" rows="3"
                                                required><%= (ra.getDescripcion() != null) ? ra.getDescripcion() : "" %></textarea>
                                            <div class="invalid-feedback">Por favor ingrese la descripción.</div>
                                        </div>

                                        <div class="d-grid gap-2">
                                            <button type="submit" class="btn btn-success">
                                                <%= btnText %>
                                            </button>
                                            <a href="resultados.jsp?asignaturaId=<%= ra.getAsignaturaId() %>"
                                                class="btn btn-secondary">Cancelar</a>
                                        </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                // Validación
                (function () {
                    'use strict'
                    var forms = document.querySelectorAll('.needs-validation')
                    Array.prototype.slice.call(forms).forEach(function (form) {
                        form.addEventListener('submit', function (event) {
                            if (!form.checkValidity()) {
                                event.preventDefault()
                                event.stopPropagation()
                            }
                            form.classList.add('was-validated')
                        }, false)
                    })
                })()
            </script>

            <%@ include file="inc/footer.jsp" %>