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

/**
 *
 * @author gabri
 */
public class Pedido {
    int id_pedido;
    double valor_pedido;
    int numero_mesa;

    
    public ResultSet selectPedido(Connection con,int id) throws SQLException{
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
