<%-- 
    Document   : index
    Created on : 03/10/2019, 19:47:18
    Author     : Aluno
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String nome=request.getParameter("nome");
        String email=request.getParameter("email");
        
       Cliente C = new Cliente();
       C.setNome(nome);
       C.setEmail(email);
       
       try {
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/databaso","root","");
                 String sql = "SELECT nome FROM Cliente WHERE nome   LIKE '"+C.getNome()+"'";
                 PreparedStatement stmt = conexao.prepareStatement(sql);   // prepara a conexao e passa sql como parametro
                 ResultSet rs = stmt.executeQuery();
                 while(rs.next()){String bdlogin = rs.getString("nome");
                 
                 if (bdlogin.equals(C.getNome())) {
                     
                     out.println ("Deu certo a comparação");
                 
                 }
                 }
                 
                 
             }catch(SQLException e ){
                 out.println("erro" + e);
          } //tratamento de erro, o try captura erro, try me diz o erro, conecta ao BD.
%>
        
        
        %>
    </body>
</html>
