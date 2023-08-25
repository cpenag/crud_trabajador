<%-- 
    Document   : index
    Created on : 16-08-2023, 19:49:27
    Author     : Hp
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/513bd683e0.js" crossorigin="anonymous"></script> 
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <title>Lista Trabajadores</title>
    </head>

    <body class="bg-success"> <br><br> 

        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>
        <div class="container border bg-light border rounded"> 
            <div class="row"> 
                <div class="col-12 p-5 text-center">               
                    <h1 class="bg-success text-light  border rounded">REGISTRO DE DESVINCULACIONES</h1>
                </div>
            </div>

            <div class="row"> 
                <div class="col-12 text-center"> 
                    <table class="table table-bordered border-success">
                        <caption>Departamento RRHH</caption>
                        <thead>
                            <tr>
                                <th scope="col" colspan="5"></th>
                                <th scope="col">
                                    <a href="crear.jsp"><i class="fa-solid fa-user-plus fa-xl"></i></a> </th>          
                            </tr>
                            <tr>

                                <th scope="col">ID</th>
                                <th scope="col">NOMBRE</th>
                                <th scope="col">SUELDO</th>
                                <th scope="col">DEPARTAMENTO</th>
                                <th scope="col">TELEFONO</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_rrhh?user=root");
                                st = con.createStatement();
                                rs = st.executeQuery("SELECT * FROM tbl_trabajadores");

                                while (rs.next()) {
                            %>
                            <tr>
                                <th scope="row"><%= rs.getString("id_trabajador")%></th>
                                <td><%= rs.getString("nombre_trabajador")%></td>    
                                <td><%= rs.getString("sueldo_trabajador")%></td>
                                <td><%= rs.getString("departamento_trabajador")%></td>
                                <td><%= rs.getString("contacto_trabajador")%></td>
                                <td>
                                    <a href="editar.jsp?id_trabajador=<%= rs.getString(1)%>&nombre_trabajador=<%= rs.getString(2)%>&sueldo_trabajador=<%= rs.getString(3)%>&departamento_trabajador=<%= rs.getString(4)%>&contacto_trabajador=<%= rs.getString(5)%>"><i class="fa fa-edit"> </i></a>
                                    <a href="eliminar.jsp?id_trabajador=<%= rs.getString(1)%>"> <i class="fa-regular fa-trash-can"></i></a>
                                </td>
                            </tr>
                            <% }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>   
        </div>
    <body/>
</html>
