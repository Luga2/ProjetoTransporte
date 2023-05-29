<%@page import="java.sql.SQLException"%>
<%@page import="model.MyConn"%>
<%
    out.print("Teste de conexão com o banco de dados:<hr>");
    
    try {
        if(MyConn.getConnection() != null) {
            out.print("Conexão bem sucedida!");
            out.print("<br>Banco de dados: " + MyConn.getConnection().getCatalog());
        } 
    } catch(SQLException erro) {
            out.print("Erro de conexão!<hr>" + erro);
    }
%>