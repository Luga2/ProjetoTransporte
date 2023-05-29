<%-- 
    Document   : lista
    Created on : 4 de mai. de 2023, 15:09:41
    Author     : QI
--%>

<%@page import="model.TransporteDAO"%>
<%@page import="model.Transporte"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>Transportes</title>
        <style>
            body{
                background-color: #696969;
            }
            table{
                border-collapse: collapse;
                background: #FFFFF0;
                border: solid 1px;
            }
            th{
                border:solid 1px;
                background: #007bff;
            }
            td{
                border: solid 1px;
            }tr:hover {
                background: #00BFFF;
            }
            a:link {
            color: red;
            text-decoration: none;
            }a:hover {
            color: blue;
            text-decoration: none;        
            }
        </style>
    </head>
    <body>
        <h1>Listar</h1>
        <table>
            <thead>
                <th>CODIGO</th>
                <th>TRANSPORTE</th>
                <th>ASSENTOS</th>
                <th>COMBUSTÍVEL</th>
                <th>ALTERAR</th>
                <th>EXCLUIR</th>
            </thead>
            <tbody>
              <%
                    TransporteDAO tdao = new TransporteDAO();
                    for(Transporte item : tdao.listTransporte()){
                    %>
                <tr>
                    <td><%= item.getCodTransporte() %></td>
                    <td><%= item.getTipo()%></td>
                    <td><%= item.getAssentos()%></td>
                    <td><%= item.getCombustivel()%></td>
                    <td>
                        <a href="UpdateTransporte?cod=<%= item.getCodTransporte() %>">✏</a>
                    </td>
                    <td>
                        <a onclick="confirmaDelete(<%= item.getCodTransporte() %>, '<%= item.getTipo() %>')"><span style="cursor: pointer">🗑</span><br></a>
                    </td>
                </tr>
              <%
                    }
                    %>
            </tbody>
            
            
        </table>
        
        <br><hr>
        <a href="home.jsp">Página inicial</a>
        
        <script>
                function confirmaDelete(cod, tipo) {
                    if(confirm("Deseja realmente excluir " + tipo + "?" )) {
                       window.location.replace("DeleteTransporte?cod=" + cod); 
                    } else {
                       alert("Exclusão cancelada!");
                    }
                }
           </script>
    </body>
</html>
