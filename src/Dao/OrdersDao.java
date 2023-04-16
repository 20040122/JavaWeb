package Dao;
import entity.Orders;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class OrdersDao {
    private Connection conn;
    private PreparedStatement stmt;
    private ResultSet rs;
    public List selectAll()
    {
        String sql = "select * from orders";
        // 创建一个集合
        List lst = new ArrayList();
        try
        {
            this.conn = BaseDao.getConn();
            this.stmt = conn.prepareStatement(sql);
            this.rs = stmt.executeQuery();
            while(rs.next())
            {
                String fid= rs.getString("fid");
                String sid = rs.getString("sid");
                String sname = rs.getString("sname");
                String fname = rs.getString("fname");
                Orders orders = new Orders(fid, sid, sname, fname);
                lst.add(orders);

            }
            return lst;
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return null;
        }
        finally
        {
            BaseDao.closeAll(conn,stmt,rs);
        }
    }
}
