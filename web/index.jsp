<%-- 
    Document   : index
    Created on : 03/10/2019, 19:47:18
    Author     : Aluno
--%>

<%@page import="javax.swing.JOptionPane"%>
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
                 String sql = "insert into cliente (nome,email) values (?,?)" ; 
                 PreparedStatement stmt = conexao.prepareStatement(sql);   // prepara a conexao e passa sql como parametro
                //preenche os valores
                 stmt.setString(1, C.getNome());
                 stmt.setString(2, C.getEmail());
                 //executa
                 stmt.execute();
                 stmt.close();
                 
                  conexao.close();
                    
                 
             }catch(SQLException e ){
                 out.println("erro" + e);
          } //tratamento de erro, o try captura erro, try me diz o erro, conecta ao BD.
%>
        
        
        %>
    </body>
</html>
