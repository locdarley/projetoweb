package dao;

import apoio.ConexaoBD;
import java.sql.ResultSet;


public class UsuarioDAO {
    
    public boolean autenticar(String usuario, String senha ) {
        try {
            String sql = "SELECT *"
                    + " FROM Usuario "
                    + "WHERE "
                    + "nome = '" + usuario + "'  and "
                    + "senha = '" + senha + "';";

            System.out.println("SQL: " + sql);

            ResultSet resultadoQ = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);

            if (resultadoQ.next()) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println("Erro ao autenticar usuário: " + e);
            return false;
        }
    }
    
}
