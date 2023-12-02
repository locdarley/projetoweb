<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="apoio.Pessoa" %>
<%@ page import="dao.PessoaDAO" %>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edição de Pessoa</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .aplicacao-conteiner {
                background-color: #f4f4f4;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                width: 300px;
                margin: 0 auto;
                text-align: center;
            }

            .aplicacao-conteiner h1 {
                font-size: 24px;
                color: #333;
            }

            .aplicacao-conteiner .form-group {
                margin-bottom: 10px;
            }

            .aplicacao-conteiner label {
                font-size: 16px;
                color: #555;
                display: block;
            }

            .aplicacao-conteiner input[type="text"],
            .aplicacao-conteiner input[type="date"] {
                width: 100%;
                padding: 10px;
                margin: 5px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .aplicacao-conteiner button[type="submit"] {
                background-color: #007bff;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .aplicacao-conteiner button[type="submit"]:hover {
                background-color: #0056b3;
            }
            .menu-button {
                margin-top: 20px;
            }

            .btn-voltar{
                background-color: #007bff;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .btn-voltar:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="aplicacao-conteiner">
            <%
                String idParam = request.getParameter("id");
                if (idParam != null && idParam.matches("\\d+")) {
                    int pessoaId = Integer.parseInt(idParam);
                    PessoaDAO pessoaDAO = new PessoaDAO();
                    Pessoa pessoa = pessoaDAO.getPessoaById(pessoaId);
                    if (pessoa != null) {
            %>
            <form action="EditarPessoaServlet" method="post">
                <h1>Edição de Pessoa</h1>
                <div class="form-group">
                    <label for="editId">ID:</label>
                    <input type="text" id="editId" name="id" value="<%= pessoa.getId()%>" readonly>
                </div>
                <div class="form-group">
                    <label for="editNome">Nome:</label>
                    <input type="text" id="editNome" name="nome" value="<%= pessoa.getNome()%>" required>
                </div>
                <div class="form-group">
                    <label for="editEmail">Email:</label>
                    <input type="text" id="editEmail" name="email" value="<%= pessoa.getEmail()%>">
                </div>
                <div class="form-group">
                    <label for="editTelefone">Telefone:</label>
                    <input type="text" id="editTelefone" name="telefone" value="<%= pessoa.getTelefone()%>">
                </div>
                <div class="form-group">
                    <label for="editDataNascimento">Data de Nascimento:</label>
                    <input type="date" id="editDataNascimento" name="dataNascimento" value="<%= pessoa.getData_nascimento()%>">
                </div>
                <button type="submit">Salvar</button>
            </form>
            <div class="menu-button">
                <a href="consulta.jsp" class="btn-voltar">Voltar para Consulta</a>
            </div>
            <%
                    } else {
                        out.println("Pessoa não encontrada.");
                    }
                } else {
                    out.println("ID de pessoa inválido.");
                }
            %>
        </div>
        <script>
            const emailInput = document.getElementById('email');
            const emailValue = emailInput.value;
            if (!emailValue.includes('@')) {
            alert('Email inválido. Deve conter o símbolo "@".');
            return false;
            }

            return true;
            }
        </script>
    </body>
</html>
