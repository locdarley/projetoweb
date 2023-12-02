package servlet;

import dao.PessoaDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CadastroPessoaServlet", urlPatterns = {"/CadastroPessoaServlet"})
public class CadastroPessoaServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String dataNascimento = request.getParameter("data_nascimento");

        PessoaDAO pessoaDAO = new PessoaDAO();
        String resultadoCadastro = pessoaDAO.cadastrarPessoa(nome, email, telefone, dataNascimento);

        if (resultadoCadastro == null) {
            
            response.sendRedirect("sucesso.jsp");
        } else {
          
            response.sendRedirect("cadastro.jsp?erro=" + resultadoCadastro);
        }
    }
}
