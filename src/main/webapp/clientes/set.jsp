<%-- 
    Document   : set
    Created on : May 11, 2020, 9:59:23 PM
    Author     : iego_
--%>

<%@page import="poo.projeto2.Cliente"%>
<%@page import="poo.projeto2.Db"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../WEB-INF/jspf/header.jspf" %>        
<%@include file="../WEB-INF/jspf/menu.jspf" %>
<!DOCTYPE html>
<%
    String error = null;
    Cliente cliente = null;
    int index = -1;
    try {
        index = Integer.parseInt(request.getParameter("index"));
        cliente = Db.getClientes().get(index);
        if (request.getParameter("set") != null) {
            String nome = request.getParameter("nome");
            String cpf = request.getParameter("cpf");
            String rg = request.getParameter("rg");
            String email = request.getParameter("email");
            String tel = request.getParameter("telefone");
            String end = request.getParameter("endereco");
             if(nome.isEmpty()) error = "Nome não pode ser nulo";
                else if(email.isEmpty()) error = "E-mail não pode ser nulo";
                else if(cpf.isEmpty()) error = "CPF não pode ser nulo";
                else if(rg.isEmpty()) error = "RG não pode ser nulo";
                else if(email.isEmpty()) error = "E-mail não pode ser nulo";
                else if(tel.isEmpty()) error = "Telefone não pode ser nulo";
                else if(end.isEmpty()) error = "Endereço não pode ser nulo";
                else {
                        Cliente editCliente = new Cliente();
                        editCliente.setAttributes(nome, cpf, rg, email, tel, end);
                        Db.getClientes().set(index, editCliente);
                        response.sendRedirect("list.jsp");
                }
        }
        
    } catch (Exception e) {
        error = "Índice inválido";
    }
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" />
        <title>Alterar Cliente</title>
    </head>
    <body>
         <div class="container">
            <div class="shadow-lg p-2 m-5 bg-light rounded">
                <div class="col-lg-8 col-md-10 mx-auto">
                    <center><h1>Alterar Cliente</h1></center>
                    
                    <% if (error != null) {%>
                    <div style="color:red"><%=error%></div>
                    <% }%>
                    
                    <form method="post">
                        <div class="marginEntradaDados">
                            <label><b> Nome </b></label><br/> 
                            <input type="text" name="nome" class="form-control" value="<%= cliente.getNome()%>" required />
                        </div>
                        <div class="marginEntradaDados">
                            <label><b> CPF </b></label><br/> 
                            <input type="text" name="cpf" class="form-control" value="<%= cliente.getCpf()%>" required />
                        </div>
                        <div class="marginEntradaDados">
                            <label><b> RG </b></label><br/> 
                            <input type="text" name="rg" class="form-control" value="<%= cliente.getRg()%>" required />
                        </div>
                        <div class="marginEntradaDados">
                            <label><b> E-mail </b></label><br/> 
                            <input type="email" name="email" class="form-control" value="<%= cliente.getEmail()%>" required />
                        </div>
                        <div class="marginEntradaDados">
                            <label><b> Telefone </b></label><br/> 
                            <input type="tel" name="telefone" class="form-control" value="<%= cliente.getTelefone()%>" required />
                        </div>
                        <div class="marginEntradaDados">
                            <label><b> Endereço </b></label><br/> 
                            <input type="text" name="endereco" class="form-control" value="<%= cliente.getEndereco()%>" required />
                        </div>
                        
                        <hr class="mb-4">
                        <div class="text-right mb-3">
                            <input class="btn btn-outline-secondary" type="submit" name="set" value="Alterar">
                            <a class="btn btn-outline-secondary" href="list.jsp">Voltar</a>
                        </div>

                    </form>
                </div>
            </div>
                        
            <footer>
                <%@include file="../WEB-INF/jspf/rodape.jspf" %>
            </footer>
        </div>
                        
    </body>
</html>
