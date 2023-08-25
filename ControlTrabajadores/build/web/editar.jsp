<%-- 
    Document   : editar
    Created on : 24-08-2023, 20:55:55
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <title>Editar registro</title>
    </head>
    <body> 
        <br><br> 
        <%
            String strID = request.getParameter("id_trabajador");
            String strNombre = request.getParameter("nombre_trabajador");
            String strSueldo = request.getParameter("sueldo_trabajador");
            String strDepartamento = request.getParameter("departamento_trabajador");
            String strContacto = request.getParameter("contacto_trabajador");
        %> 

        <div class="container border bg-success"> 
            <div class="row"> 
                <div class="col-12 p-5 text-center">               
                    <h1 class="text-light  border rounded">EDITAR REGISTRO</h1>
                </div>
            </div> 
            <div class="col-12 p-5">  <div class="row">
                    <form action="editar.jsp" method="post" class="text-light">
                        <div class="form-group">
                            <label>NOMBRE</label>
                            <input value="<%= strNombre%>" name="nombre_trabajador" type="text" class="form-control"  placeholder="" required="">
                        </div>
                        <div class="form-group">
                            <label>SUELDO</label>
                            <input value="<%= strSueldo%>" name="sueldo_trabajador" type="text" class="form-control"  placeholder="" required="">
                        </div>
                        <div class="form-group">
                            <label>DEPARTAMENTO</label>
                            <input value="<%= strDepartamento%>" name="departamento_trabajador" type="text" class="form-control"  placeholder="" required="">
                        </div>
                        <div class="form-group">
                            <label>TELEFONO</label>
                            <input value="<%= strContacto%>" name="contacto_trabajador" type="text" class="form-control"  placeholder="" required="">
                        </div>
                        <br><br>
                        <div class="d-grid gap-2 col-6 mx-auto">
                            <input type="hidden" name="enviar" value="enviar">
                            <button type="submit" class="btn btn-light btn btn-lg">ACTUALIZAR</button>
                            <a href="index.jsp" class="btn btn-danger btn btn-lg">CANCELAR</a>
                            <input type="hidden" name="id_trabajador" value="<%= strID%>">
                        </div>
                    </form>
                </div>
            </div>

        </div>
        <%
            if (request.getParameter("enviar") != null) {
                try {
                    Connection con = null;
                    Statement st = null;

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_rrhh?user=root");
                    st = con.createStatement();
                    st.executeUpdate("UPDATE tbl_trabajadores SET nombre_trabajador= '" + strNombre + "', sueldo_trabajador= '" + strSueldo + "' , departamento_trabajador= '" + strDepartamento + "', contacto_trabajador = '" + strContacto + "' WHERE id_trabajador = '" + strID + "'");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
    </body>
</html>