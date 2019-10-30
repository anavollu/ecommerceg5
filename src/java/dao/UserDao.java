package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.*;
import org.hibernate.validator.constraints.br.CPF;

public class UserDao extends BasicDao {
    private ArrayList<User> list = new ArrayList<>();
    private PreparedStatement prepareStatement;
    
    
    public User save(User user){
        
        String sql = "insert into user (user_cpf, user_email, user_fullName, user_username, user_password, user_role) values (?,?,?,?,?,?)";
        try {
            prepareStatement = this.con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            prepareStatement.setString(1, user.getCpf());
            prepareStatement.setString(2, user.getEmail());
            prepareStatement.setString(3, user.getFullName());
            prepareStatement.setString(4, user.getUsername());
            prepareStatement.setString(5, user.getPassword());
            prepareStatement.setString(6, user.getRole());
            prepareStatement.executeUpdate();
            ResultSet resultSet = prepareStatement.getGeneratedKeys();
            if (resultSet.next()) {
                int id = resultSet.getInt(1);
                user.setId(id);
            }
            prepareStatement.close();
           
            
            return user; // retorna um user, com o id que foi atribuido ao ser realizado o insert. É utilizado em UserController,
                        // para a criação do carrinho do usuario, que tem como chave estrangeira o id do usuário
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
        
    }
    
    
    public User getByUserId(Long userId) {
        String sql = "select * from User where id = ?;";
        User user = null;
        try {
            PreparedStatement stmt = this.con.prepareStatement(sql);
            stmt.setLong(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setCpf(rs.getString("user_cpf"));
                user.setEmail(rs.getString("user_email"));
                user.setFullName(rs.getString("user_fullName"));
                user.setUsername(rs.getString("user_username"));
                user.setPassword(rs.getString("user_password"));
                
                user.setId(rs.getInt("id"));
                user.setRole(rs.getString("user_role"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return user;
    }
    public User getByUserCpf(String user_cpf) {
        String sql = "select * from user where user_cpf = ?;";
        User user = null;
        try {
            PreparedStatement stmt = this.con.prepareStatement(sql);
            stmt.setString(1, user_cpf);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setCpf(rs.getString("user_cpf"));
                user.setEmail(rs.getString("user_email"));
                user.setFullName(rs.getString("user_fullName"));
                user.setUsername(rs.getString("user_username"));
                user.setPassword(rs.getString("user_password"));
                
                user.setId(rs.getInt("user_id"));
                user.setRole(rs.getString("user_role"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return user;
    }

    public User update(User user) {
        String sql = "update user set "
                + " cpf = ?, "
                + " email = ?, "
                + " fullName = ?, "
                + " username = ?, "
                + " password = ? "
                + " where id = ?; ";
        try {
            PreparedStatement stmt = this.con.prepareStatement(sql);
            stmt.setString(1, user.getCpf());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getFullName());
            stmt.setString(4, user.getUsername());
            stmt.setString(5, user.getPassword());
            stmt.setLong(6, user.getId());
            int executeUpdate = stmt.executeUpdate();
            if (executeUpdate == 1) {
                return user;
            }
            return null;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }
    
    public void deleteUserCart(int  user_cart_id){
        String sql = "DELETE FROM cart WHERE cart_user_id = ?";
        try {
            PreparedStatement stmt = this.con.prepareStatement(sql);
            stmt.setInt(1, user_cart_id);
            int rowsHitted = stmt.executeUpdate(); // executa a query e retorna o numero de linhas afetadas
            stmt.close();
        } catch (Exception e) {
            throw  new RuntimeException("Erro ao excluir carrtinho de usuario:" + e.getMessage());
        }
    }

    public int deleteByUserId(int userId) {
        
        deleteUserCart(userId);
        
        String sql = "DELETE FROM user WHERE user_id = ?;";
        try {
            PreparedStatement stmt = this.con.prepareStatement(sql);
            stmt.setInt(1, userId);
            int rowsHitted = stmt.executeUpdate(); // executa a query e retorna o numero de linhas afetadas
            stmt.close();
            return rowsHitted;
            
        } catch (SQLException ex) {
            return 0;    
        }
    }
    
    
    
    public ArrayList<User> listarTodos(){
        String sql = "SELECT * FROM user ";
        try {
            Statement st = this.con.createStatement();
            
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                User user = new User();
                user.setCpf(rs.getString("user_cpf"));
                user.setEmail(rs.getString("user_email"));
                user.setFullName(rs.getString("user_fullName"));
                user.setUsername(rs.getString("user_username"));
                user.setPassword(rs.getString("user_password"));
                
                user.setId(rs.getInt("user_id"));
                user.setRole(rs.getString("user_role"));
                //user.setId(user_id);
                list.add(user);
            }
        } catch (Exception erro) {
             throw new RuntimeException("Erro para listar os usuario: "+ erro.getMessage());
        }
        return list;
    }
    
    public int amountOfUsers(){
        String sql = "SELECT COUNT(user_id) FROM user";
        try {
            Statement st = this.con.createStatement();
            ResultSet rs = st.executeQuery(sql);
           
            while(rs.next()){
                return rs.getInt(1);
            }
            
        } catch (Exception e) {
            throw new RuntimeException("Erro ao contabilizar a quantidade de usuarios: "+ e.getMessage());
        }
       return 0;
    }

}
