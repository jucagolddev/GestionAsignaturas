<%@ page import="dao.CriterioEvaluacionDAO, model.CriterioEvaluacion" %>
    <% request.setCharacterEncoding("UTF-8"); String accion=request.getParameter("accion"); String
        raIdStr=request.getParameter("raId"); int raId=Integer.parseInt(raIdStr); CriterioEvaluacionDAO dao=new
        CriterioEvaluacionDAO(); if ("crear".equals(accion)) { String descripcion=request.getParameter("descripcion");
        dao.insertar(new CriterioEvaluacion(descripcion, raId)); } else if ("editar".equals(accion)) { int
        id=Integer.parseInt(request.getParameter("id")); String descripcion=request.getParameter("descripcion");
        dao.actualizar(new CriterioEvaluacion(id, descripcion, raId)); } else if ("eliminar".equals(accion)) { int
        id=Integer.parseInt(request.getParameter("id")); dao.eliminar(id); } response.sendRedirect("criterios.jsp?raId=" + raId);
%>