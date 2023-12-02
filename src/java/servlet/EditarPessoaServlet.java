package servlet;

import dao.PessoaDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EditarPessoaServlet")
public class EditarPessoaServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String dataNascimento = request.getParameter("dataNascimento");

        PessoaDAO pessoaDAO = new PessoaDAO();
        String resultado = pessoaDAO.editarPessoa(id, nome, email, telefone, dataNascimento);

        if (resultado == null) {
            response.sendRedirect("consulta.jsp");
        } else {
            // Erro na edição, você pode lidar com isso de acordo com suas necessidades
            request.setAttribute("erro", resultado);
            request.getRequestDispatcher("editar.jsp").forward(request, response);
        }
    }

}
