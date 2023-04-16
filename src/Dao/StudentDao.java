package Dao;
import entity.Student;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
public class StudentDao {
    private Connection conn;
    private PreparedStatement stmt;
    private ResultSet rs;

    public List selectAll() throws SQLException {
        String sql = "select * from student";
        List lst = new ArrayList();
        try {
            this.conn = BaseDao.getConn();
            this.stmt = conn.prepareStatement(sql);
            this.rs = stmt.executeQuery();
            while (rs.next()) {
                String sid = rs.getString("sid");
                String sname = rs.getString("sname");
                String sex = rs.getString("sex");
                Student student = new Student(sid, sname, sex);
                lst.add(student);
            }
            return lst;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            BaseDao.closeAll(conn, stmt, rs);
        }
    }

    public boolean insert(Student student) {
        String sql = "insert into student values(?,?,?)";
        try {
            conn = BaseDao.getConn();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, student.getSid());
            stmt.setString(2, student.getSname());
            stmt.setString(3, student.getSex());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            BaseDao.closeAll(conn, stmt, rs);
        }
    }
    public  String deleteByid(String sid) {
        String sql = "delete from student where sid=?";
        try {
            conn = BaseDao.getConn();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, sid);
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
    public boolean update(Student student){
        String sql = "update student set sname=?,sex=? where sid=?";
        try {
            conn = BaseDao.getConn();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,student.getSname());
            stmt.setString(2,student.getSex() );
            stmt.setString(3,student.getSid());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            BaseDao.closeAll(conn, stmt, rs);
        }
    }
}