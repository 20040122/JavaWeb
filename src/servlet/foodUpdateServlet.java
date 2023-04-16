package servlet;
import Dao.FoodDao;
import entity.Food;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet("/foodUpdateServlet")
public class foodUpdateServlet extends HttpServlet {
    private static final long serialVersionUid = 1L;
    public foodUpdateServlet() {
        super();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fid= req.getParameter("fid");
        String fname= req.getParameter("fname");
        String cd=req.getParameter("cd");
        Food food=new Food(fid,fname,cd);
        FoodDao dao = new FoodDao();
        dao.update(food);
        resp.sendRedirect("FoodDel.jsp");
        PrintWriter out = resp.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset=\"utf-8\">");
        out.println("<title></title>");
        out.println("</head>");
        out.println("<body>");
        out.println("</body>");
        out.println("</html>");
        out.close();
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}