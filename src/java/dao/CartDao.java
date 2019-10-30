/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import model.Cart;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


/**
 *
 * @author Celestino
 */
public class CartDao extends BasicDao {
     private PreparedStatement prepareStatement;
     
     
     public int createCart(int user_id){
         int id = 0;
        String sql = "insert into cart( cart_user_id ) values (?);";
         try {
            prepareStatement = this.con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            prepareStatement.setInt(1, user_id);
            prepareStatement.executeUpdate();
            ResultSet resultSet = prepareStatement.getGeneratedKeys();
            if (resultSet.next()) {
                id = resultSet.getInt(1);
               
            }
           
            prepareStatement.close();
            return id;
         } catch (SQLException e) {
             throw new RuntimeException("Erro ao criar carrinho do usuário: "+e.getMessage());
         }
        
         
     }
     
     public int  deleteCart(int cart_id){
         String sql = "DELETE FROM cart WHERE cart_id = ?;";
          try {
            PreparedStatement stmt = this.con.prepareStatement(sql);
            stmt.setInt(1, cart_id);
            int rowsHitted = stmt.executeUpdate(); // executa a query e retorna o numero de linhas afetadas
            stmt.close();
            return rowsHitted;
            
        } catch (SQLException ex) {
            return 0;
            
            
        }
         
         
     }

}
