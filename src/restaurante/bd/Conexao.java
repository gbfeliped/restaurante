/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package restaurante.bd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author Gabriel
 */
public class Conexao {
    private Connection con;
    
    public Connection getCon() {
        return con;
    }

    public void setCon() {
        try{
            Connection con1;
            Class.forName("com.mysql.cj.jdbc.Driver");
            con1 = DriverManager.getConnection("jdbc:mysql://localhost/restaurante?useTimezone=true&serverTimezone=UTC", "root", "");
            System.out.println("Banco de dados se conectou com sucesso!");
            this.con = con1;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Banco de dados nao conectou: "+e);
            this.con = null;
        }
        
    }
    
    public void closeCon() throws SQLException {
        if(this.con != null) {
            this.con.close();
            System.out.println("Conexão com o banco de dados foi fechada!");
        } else {
            System.out.println("Não foi possivel fechar a conexão com o banco de dados !");
        }
    }
    /*
    
    */
}
