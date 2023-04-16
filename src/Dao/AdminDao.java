package Dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import entity.Admin;
public class AdminDao {
    private Connection conn;
    private PreparedStatement stmt;
    private ResultSet rs;
    public Admin selectByano(String ano){
        String sql = "select * from admin where ano=?";
        try {
            conn = BaseDao.getConn();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, ano);
            rs = stmt.executeQuery();
            if(rs.next()){
                String  ano1 = rs.getString("ano");
                String apd1 = rs.getString("apd");
                return new Admin(ano1, apd1);
            }
            return null;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        } finally {
            BaseDao.closeAll(conn, stmt, rs);
        }
    }
}
