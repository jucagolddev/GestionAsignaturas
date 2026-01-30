<%@ page import="dao.AsignaturaDAO, model.Asignatura" %>
    <%@ include file="inc/header.jsp" %>

        <% String idStr=request.getParameter("id"); Asignatura asig=new Asignatura(); String titulo="Nueva Asignatura" ;
            String btnText="Guardar" ; if (idStr !=null && !idStr.isEmpty()) { AsignaturaDAO dao=new AsignaturaDAO();
            asig=dao.obtenerPorId(Integer.parseInt(idStr)); if (asig !=null) { titulo="Editar Asignatura" ;
            btnText="Actualizar" ; } } %>

            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header bg-primary text-white">
                            <h4 class="mb-0">
                                <%= titulo %>
                            </h4>
                        </div>
                        <div class="card-body">
                            <form action="accionesAsignatura.jsp" method="post" class="needs-validation" novalidate>
                                <input type="hidden" name="accion" value="<%= (asig.getId() > 0) ? " editar" : "crear"
                                    %>">
                                <% if (asig.getId()> 0) { %>
                                    <input type="hidden" name="id" value="<%= asig.getId() %>">
                                    <% } %>

                                        <div class="mb-3">
                                            <label for="codigo" class="form-label">Código</label>
                                            <input type="text" class="form-control" id="codigo" name="codigo" required
                                                value="<%= (asig.getCodigo() != null) ? asig.getCodigo() : "" %>">
                                            <div class="invalid-feedback">Por favor ingrese el código.</div>
                                        </div>

                                        <div class="mb-3">
                                            <label for="nombre" class="form-label">Nombre</label>
                                            <input type="text" class="form-control" id="nombre" name="nombre" required
                                                value="<%= (asig.getNombre() != null) ? asig.getNombre() : "" %>">
                                            <div class="invalid-feedback">Por favor ingrese el nombre.</div>
                                        </div>

                                        <div class="d-grid gap-2">
                                            <button type="submit" class="btn btn-success">
                                                <%= btnText %>
                                            </button>
                                            <a href="asignaturas.jsp" class="btn btn-secondary">Cancelar</a>
                                        </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                // Validación de Bootstrap
                (function () {
                    'use strict'
                    var forms = document.querySelectorAll('.needs-validation')
                    Array.prototype.slice.call(forms)
                        .forEach(function (form) {
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