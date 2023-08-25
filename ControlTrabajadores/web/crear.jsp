<%-- 
    Document   : crear
    Created on : 24-08-2023, 18:44:09
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
        <title>Nuevo registro</title>
    </head>
    <body> 
        <br><br> 
        <div class="container border bg-success"> 
            <div class="row"> 
                <div class="col-12 p-5 text-center">               
                    <h1 class="text-light  border rounded">REGISTRO NUEVO</h1>
                </div>
            </div> 
            <div class="col-12 p-5">  <div class="row">
                    <form action="crear.jsp" method="post" class="text-light">
                        <div class="form-group">
                            <label>NOMBRE</label>
                            <input name="nombre_trabajador" type="text" class="form-control"  placeholder="Juan Soto Perez" required="">
                        </div>
                        <div class="form-group">
                            <label>SUELDO</label>
                            <input name="sueldo_trabajador" type="text" class="form-control"  placeholder="Sin puntos" required="">
                        </div>
                        <div class="form-group">
                            <label>DEPARTAMENTO</label>
                            <input name="departamento_trabajador" type="text" class="form-control"  placeholder="Ej: Finanzas" required="">
                        </div>
                        <div class="form-group">
                            <label>TELEFONO</label>
                            <input name="contacto_trabajador" type="text" class="form-control"  placeholder="Ej: 998577573" required="">
                        </div>
                        <br><br>
                        <div class="d-grid gap-2 col-6 mx-auto">
                            <input type="hidden" name="enviar" value="enviar">
                            <button type="submit" class="btn btn-light btn btn-lg">REGISTRAR</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%
            if (request.getParameter("enviar") != null) {
                String strNombre = request.getParameter("nombre_trabajador");
                String strSueldo = request.getParameter("sueldo_trabajador");
                String strDepartamento = request.getParameter("departamento_trabajador");
                String strContacto = request.getParameter("contacto_trabajador");

                try {
                    Connection con = null;
                    Statement st = null;

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_rrhh?user=root");
                    st = con.createStatement();
                    st.execute("INSERT INTO tbl_trabajadores (nombre_trabajador,sueldo_trabajador,departamento_trabajador,contacto_trabajador) VALUES ('" + strNombre + "','" + strSueldo + "','" + strDepartamento + "','" + strContacto + "')");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>  
    </body>
</html>
