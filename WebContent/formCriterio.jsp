<%@ page import="dao.CriterioEvaluacionDAO, model.CriterioEvaluacion" %>
    <%@ include file="inc/header.jsp" %>

        <% String idStr=request.getParameter("id"); String raIdStr=request.getParameter("raId"); if (raIdStr==null) {
            response.sendRedirect("asignaturas.jsp"); return; } CriterioEvaluacion ce=new CriterioEvaluacion();
            ce.setRaId(Integer.parseInt(raIdStr)); String titulo="Nuevo Criterio de Evaluación" ; String
            btnText="Guardar" ; if (idStr !=null && !idStr.isEmpty()) { CriterioEvaluacionDAO dao=new
            CriterioEvaluacionDAO(); ce=dao.obtenerPorId(Integer.parseInt(idStr)); if (ce !=null) {
            titulo="Editar Criterio de Evaluación" ; btnText="Actualizar" ; } } %>

            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header bg-secondary text-white">
                            <h4 class="mb-0">
                                <%= titulo %>
                            </h4>
                        </div>
                        <div class="card-body">
                            <form action="accionesCriterio.jsp" method="post" class="needs-validation" novalidate>
                                <input type="hidden" name="accion" value="<%= (ce.getId() > 0) ? " editar" : "crear"
                                    %>">
                                <input type="hidden" name="raId" value="<%= ce.getRaId() %>">
                                <% if (ce.getId()> 0) { %>
                                    <input type="hidden" name="id" value="<%= ce.getId() %>">
                                    <% } %>

                                        <div class="mb-3">
                                            <label for="descripcion" class="form-label">Descripción del Criterio</label>
                                            <textarea class="form-control" id="descripcion" name="descripcion" rows="3"
                                                required><%= (ce.getDescripcion() != null) ? ce.getDescripcion() : "" %></textarea>
                                            <div class="invalid-feedback">Por favor ingrese la descripción.</div>
                                        </div>

                                        <div class="d-grid gap-2">
                                            <button type="submit" class="btn btn-success">
                                                <%= btnText %>
                                            </button>
                                            <a href="criterios.jsp?raId=<%= ce.getRaId() %>"
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