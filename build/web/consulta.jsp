<%@page import="java.util.ArrayList"%>
<%@page import="apoio.Pessoa"%>
<%@page import="dao.PessoaDAO"%>

<!DOCTYPE html>
<html>
<head>
    <title>Consulta de Pessoas</title>
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
            width: 80%; 
            margin: 0 auto;
            text-align: center;
        }

        .aplicacao-conteiner h2 {
            font-size: 24px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a {
            text-decoration: none;
            color: #0074D9;
        }

        a:hover {
            text-decoration: underline;
        }

        .menu-button {
            margin-top: 20px;
        }

        .btn-voltar {
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

        .btn-excluir {
            background-color: #d9534f;
            color: #fff;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-excluir:hover {
            background-color: #c9302c;
        }

        /* Estilos para o modal de edição */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }

        .modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            text-align: center;
        }

        .close {
            color: #888;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }
        .btn-editar {
            background-color: #0074D9;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }


    </style>
</head>
<body>
<div class="aplicacao-conteiner">
    <h2>Consulta de Pessoas</h2>
    <%
        ArrayList<Pessoa> pessoas = new PessoaDAO().consultarPessoa();
    %>
    <h4>Total de cadastros: <%= pessoas.size()%></h4>

    <table>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Email</th>
            <th>Telefone</th>
            <th>Data de Nascimento</th>
            <th>Ações</th>
        </tr>
        <%
            for (int i = 0; i < pessoas.size(); i++) {
                Pessoa pessoa = pessoas.get(i);
        %>
        <tr>
            <td><%= pessoa.getId()%></td>
            <td><%= pessoa.getNome()%></td>
            <td><%= pessoa.getEmail()%></td>
            <td><%= pessoa.getTelefone()%></td>
            <td><%= pessoa.getData_nascimento()%></td>
            <td>
                <button onclick="window.location.href='edicao.jsp?id=<%= pessoa.getId() %>'" class="btn-editar">Editar</button>
                <a href="javascript:void(0);" onclick="excluirPessoa(<%= pessoa.getId() %>)" class="btn-excluir">Excluir</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    <div class="menu-button">
        <a href="menu.jsp" class="btn-voltar">Voltar ao Menu</a>
    </div>
</div>

    <script>
       function excluirPessoa(id) {
        var confirmar = confirm("Tem certeza que deseja excluir esta pessoa?");
        if (confirmar) {
            window.location.href = "ExcluirPessoaServlet?id=" + id; // Redireciona para o servlet de exclusão
        }
    }
</script>

</body>
</html>
