package Dao;
import entity.Food;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
public class FoodDao {
    private Connection conn;
    private PreparedStatement stmt;
    private ResultSet rs;

    public List selectAll() throws SQLException {
        String sql = "select * from food";
        List lst = new ArrayList();
        try {
            this.conn = BaseDao.getConn();
            this.stmt = conn.prepareStatement(sql);
            this.rs = stmt.executeQuery();
            while (rs.next()) {
                String fid = rs.getString("fid");
                String fname = rs.getString("fname");
                String cd = rs.getString("cd");
                Food food = new Food(fid, fname, cd);
                lst.add(food);
            }
            return lst;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            BaseDao.closeAll(conn, stmt, rs);
        }
    }

    public boolean insert(Food food) {
        String sql = "insert into food values(?,?,?)";
        try {
            conn = BaseDao.getConn();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, food.getFid());
            stmt.setString(2, food.getFname());
            stmt.setString(3, food.getCd());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            BaseDao.closeAll(conn, stmt, rs);
        }
    }

    public  String deleteByid1(String fid) {
        String sql = "delete from food where fid=?";
        try {
            conn = BaseDao.getConn();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, fid);
            if (stmt.executeUpdate() > 0) {
                return "删除成功";
            } else {
                return "删除失败";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "删除失败";
        } finally {
            BaseDao.closeAll(conn, stmt, rs);
        }

    }
    public boolean update(Food food) {
        String sql = "update food set fname=?,cd=? where fid=?";
        try {
            conn = BaseDao.getConn();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, food.getFname());
            stmt.setString(2, food.getCd());
            stmt.setString(3, food.getFid());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            BaseDao.closeAll(conn, stmt, rs);
        }
    }

}