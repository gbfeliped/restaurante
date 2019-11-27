/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package restaurante;

import java.awt.Dimension;
import java.awt.GridLayout;
import javax.swing.JFrame;
import java.sql.SQLException;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import restaurante.bd.Conexao;

/**
 *
 * @author Gabriel
 */
public class Restaurante {
    
    public int numeroMesa = 0;


    /**
     * @param args the command line arguments
     * @throws java.sql.SQLException
     */
    public static void main(String[] args) throws SQLException {
        //Conexao bd = new Conexao();
        // Inicializar o banco de dados;
        //bd.MyConexao();
        //

        Inicio login = new Inicio();
        login.setVisible(true);
        //login.setExtendedState(JFrame.MAXIMIZED_BOTH);
    }
    public int getNumeroMesa() {
        return numeroMesa;
    }

    public void setNumeroMesa(int numeroMesa) {
        this.numeroMesa = numeroMesa;
    }
    
}
