<%@ page import="dao.ResultadoAprendizajeDAO, model.ResultadoAprendizaje" %>
    <% request.setCharacterEncoding("UTF-8"); String accion=request.getParameter("accion"); String
        asignaturaIdStr=request.getParameter("asignaturaId"); int asignaturaId=Integer.parseInt(asignaturaIdStr);
        ResultadoAprendizajeDAO dao=new ResultadoAprendizajeDAO(); if ("crear".equals(accion)) { String
        descripcion=request.getParameter("descripcion"); dao.insertar(new ResultadoAprendizaje(descripcion,
        asignaturaId)); } else if ("editar".equals(accion)) { int id=Integer.parseInt(request.getParameter("id"));
        String descripcion=request.getParameter("descripcion"); dao.actualizar(new ResultadoAprendizaje(id, descripcion,
        asignaturaId)); } else if ("eliminar".equals(accion)) { int id=Integer.parseInt(request.getParameter("id"));
        dao.eliminar(id); } response.sendRedirect("resultados.jsp?asignaturaId=" + asignaturaId);
%>