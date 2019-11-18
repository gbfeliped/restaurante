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
    
    
    public static void main(String[] args) {
        
    }
    
    public void MyConexao () {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/restaurante?useTimezone=true&serverTimezone=UTC", "root", "");
            System.out.println("Banco de dados se conectou com sucesso!");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Banco de dados nao conectou: "+e);
        }
    }
    /*
    public ResultSet selectPedido(int id) throws SQLException{
        PreparedStatement stm = con.prepareStatement("select * from pedido where id_pedido = ?");
        stm.setInt(1, id);
        ResultSet rs = stm.executeQuery();
        return rs;
    }
    */
}
