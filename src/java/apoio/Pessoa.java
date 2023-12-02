package apoio;

import java.sql.Date;

public class Pessoa {

    private int id;
    private String nome;
    private String email;
    private String telefone;
    private Date dataNascimento;

    // Construtor
    public Pessoa(int id, String nome, String email, String telefone, Date data_nascimento) {
        this.id = id;
        this.nome = nome;
        this.email = email;
        this.telefone = telefone;
        this.dataNascimento = data_nascimento;
    }

    public Pessoa() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Pessoa(int id, String nome, String email, String telefone, String dataNascimento) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    // Getters e Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public Date getData_nascimento() {
        return dataNascimento;
    }

    public void setData_nascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }
}
