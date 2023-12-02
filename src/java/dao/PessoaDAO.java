package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.sql.DataSource;
import apoio.Pessoa;
import java.sql.Date;

public class PessoaDAO {

    private DataSource dataSource;

  

    public String cadastrarPessoa(String nome, String email, String telefone, String data_nascimento) {
        try (Connection conn = dataSource.getConnection()) {
            String sql = "INSERT INTO PESSOA (nome, email, telefone, data_nascimento) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, nome);
            stmt.setString(2, email);
            stmt.setString(3, telefone);
            stmt.setDate(4, java.sql.Date.valueOf(data_nascimento));

            int retorno = stmt.executeUpdate();

            if (retorno > 0) {
                return null; // Sucesso no cadastro
            } else {
                return "Erro ao cadastrar pessoa";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return e.toString();
        }
    }

    public ArrayList<Pessoa> consultarPessoa() {
        ArrayList<Pessoa> listaPessoas = new ArrayList<>();
        try (Connection conn = dataSource.getConnection()) {
            String sql = "SELECT id, nome, email, telefone, data_nascimento FROM PESSOA";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String nome = rs.getString("nome");
                String email = rs.getString("email");
                String telefone = rs.getString("telefone");
                Date data_nascimento = rs.getDate("data_nascimento");

                Pessoa pessoa = new Pessoa(id, nome, email, telefone, data_nascimento);
                listaPessoas.add(pessoa);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaPessoas;
    }

    public String excluirPessoa(int id) {
        try (Connection conn = dataSource.getConnection()) {
            String sql = "DELETE FROM PESSOA WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);

            int retorno = stmt.executeUpdate();

            if (retorno > 0) {
                return null; // Sucesso na exclusão
            } else {
                return "Erro ao excluir pessoa";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return e.toString();
        }
    }

    public Pessoa getPessoaById(int id) {
        try (Connection conn = dataSource.getConnection()) {
            String sql = "SELECT id, nome, email, telefone, data_nascimento FROM PESSOA WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String nome = rs.getString("nome");
                String email = rs.getString("email");
                String telefone = rs.getString("telefone");
                Date data_nascimento = rs.getDate("data_nascimento");

                return new Pessoa(id, nome, email, telefone, data_nascimento);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

 public String editarPessoa(int id, String nome, String email, String telefone, String dataNascimento) {
    try (Connection conn = dataSource.getConnection()) {
        String sql = "UPDATE PESSOA SET nome = ?, email = ?, telefone = ?, data_nascimento = ? WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, nome);
        stmt.setString(2, email);
        stmt.setString(3, telefone);
        stmt.setDate(4, java.sql.Date.valueOf(dataNascimento));
        stmt.setInt(5, id);

        int retorno = stmt.executeUpdate();

        if (retorno > 0) {
            return null; 
        } else {
            return "Erro ao editar pessoa";
        }
    } catch (SQLException e) {
        e.printStackTrace();
        return e.toString();
    }
}

}
