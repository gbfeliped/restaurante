/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package restaurante;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author gabri
 */
public class Pedido {
    int id_pedido;
    double valor_pedido;
    int numero_mesa;

    public ResultSet getProdutosFromPedido(Connection con, int id) throws SQLException{
        PreparedStatement stm = con.prepareStatement("SELECT * FROM pedido_produto INNER JOIN produto ON pedido_produto.id_produtoFK = produto.id_produto where id_pedidoFK = ?");
        stm.setInt(1, id);
        ResultSet rs = stm.executeQuery();
        return rs;
    }
    public ResultSet selectAll(Connection con) throws SQLException{
        PreparedStatement stm = con.prepareStatement("select * from pedido");
        ResultSet rs = stm.executeQuery();
        return rs;
    }
    public ResultSet select(Connection con,int id) throws SQLException{
        PreparedStatement stm = con.prepareStatement("select * from pedido where id_pedido = ?");
        stm.setInt(1, id);
        ResultSet rs = stm.executeQuery();
        return rs;
    }
    
    public int deletePedido(Connection con, int id) throws SQLException {
        PreparedStatement stm = con.prepareStatement("delete from pedido where id_pedido = ?");
        stm.setInt(1, id);
        return stm.executeUpdate();
    }
    
    public int insertPedido(Connection con,double valor,int num_m) throws SQLException{
        PreparedStatement stm = con.prepareStatement("insert into pedido(valor_Pedido, numero_Mesa) values (?,?)", Statement.RETURN_GENERATED_KEYS);
        stm.setDouble(1, valor);
        stm.setInt(2, num_m);
        stm.executeUpdate();
        ResultSet rs = stm.getGeneratedKeys();
        rs.next();
        return rs.getInt(1);
    }
    public int insertProdutoxPedido(Connection con,int idpe, int idpo) throws SQLException {
        PreparedStatement stm = con.prepareStatement("insert into pedido_produto(id_pedidoFK,id_produtoFK) values (?,?)");
        stm.setInt(1, idpe);
        stm.setInt(2, idpo);
        return stm.executeUpdate();
    }
    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public double getValor_pedido() {
        return valor_pedido;
    }

    public void setValor_pedido(double valor_pedido) {
        this.valor_pedido = valor_pedido;
    }

    public int getNumero_mesa() {
        return numero_mesa;
    }

    public void setNumero_mesa(int numero_mesa) {
        this.numero_mesa = numero_mesa;
    }
    
}
