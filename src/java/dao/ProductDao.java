package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.Product;

public class ProductDao extends BasicDao {

    public Product save(Product product) {
        String sql = "INSERT INTO Product (name, description, price, imageUrl) VALUES (?, ?, ?, ?);";
        try {
            PreparedStatement prepareStatement = this.con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            prepareStatement.setString(1, product.getName());
            prepareStatement.setString(2, product.getDescription());
            prepareStatement.setDouble(3, product.getPrice());
            prepareStatement.setString(4, product.getImageUrl());
            prepareStatement.executeUpdate();
            ResultSet resultSet = prepareStatement.getGeneratedKeys();
            if (resultSet.next()) {
                Long id = resultSet.getLong(1);
                product.setId(id);
            }
            return product;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public Product getByProductId(Long productId) {
        String sql = "select * from Product where id = ?;";
        Product product = null;
        try {
            PreparedStatement stmt = this.con.prepareStatement(sql);
            stmt.setLong(1, productId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String description = rs.getString("description");
                Double price = rs.getDouble("price");
                String imageUrl = rs.getString("imageUrl");
                product = new Product(name, description, price, imageUrl);
                product.setId(rs.getLong("id"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return product;
    }

    public Product update(Product product) {
        String sql = "update Product set "
                + " name = ?, "
                + " description = ?, "
                + " price = ?, "
                + " imageUrl = ? "
                + " where id = ?; ";
        try {
            PreparedStatement stmt = this.con.prepareStatement(sql);
            stmt.setString(1, product.getName());
            stmt.setString(2, product.getDescription());
            stmt.setDouble(3, product.getPrice());
            stmt.setString(4, product.getImageUrl());
            stmt.setLong(5, product.getId());
            int executeUpdate = stmt.executeUpdate();
            if (executeUpdate == 1) {
                return product;
            }
            return null;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public int deleteByProductId(Long productId) {
        String sql = "delete from Product where id = ?;";
        try {
            PreparedStatement stmt = this.con.prepareStatement(sql);
            stmt.setLong(1, productId);
            return stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
            return 0;
        }
    }

}
