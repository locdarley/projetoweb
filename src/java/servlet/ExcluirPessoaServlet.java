package servlet;

import dao.PessoaDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ExcluirPessoaServlet")
public class ExcluirPessoaServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        PessoaDAO pessoaDAO = new PessoaDAO();
        String mensagem = pessoaDAO.excluirPessoa(id);

        if (mensagem == null) {
            response.sendRedirect("consulta.jsp");
        } else {
            response.getWriter().println("Erro ao excluir pessoa: " + mensagem);
        }
    }
}
