<%@ page import="dao.AsignaturaDAO, model.Asignatura" %>
    <% request.setCharacterEncoding("UTF-8"); String accion=request.getParameter("accion"); AsignaturaDAO dao=new
        AsignaturaDAO(); String error=null; if ("crear".equals(accion)) { String codigo=request.getParameter("codigo");
        String nombre=request.getParameter("nombre"); dao.insertar(new Asignatura(nombre, codigo)); } else if
        ("editar".equals(accion)) { int id=Integer.parseInt(request.getParameter("id")); String
        codigo=request.getParameter("codigo"); String nombre=request.getParameter("nombre"); dao.actualizar(new
        Asignatura(id, nombre, codigo)); } else if ("eliminar".equals(accion)) { int
        id=Integer.parseInt(request.getParameter("id")); dao.eliminar(id); } response.sendRedirect("asignaturas.jsp");
        %>