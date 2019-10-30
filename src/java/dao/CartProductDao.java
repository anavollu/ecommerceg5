/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


/**
 *
 * @author Celestino
 */
public class CartProductDao extends BasicDao{
    private PreparedStatement prepareStatement;
    
    
    public void insertProductOnCart(int cart_id, int product_id, int quantidade){
        String sql = "INSERT INTO carrinho_produto (car_prod_carrinho, car_prod_produto, car_prod_quantidade) VALUES (?,?,?)";
        try {
            prepareStatement = this.con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            prepareStatement.setInt(1, cart_id);
            prepareStatement.setInt(2, product_id);
            prepareStatement.setInt(3, quantidade);
            
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao inserir produto no carrinho do usuario: "+e.getMessage());
        }
    }
    
    public void deleteProductFromCart(){
        
    }
    
    public void clearCart(int cart_id){
        String sql = "DELETE FROM ";
    }
    
}
