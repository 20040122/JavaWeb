package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/StudentAdd.jsp", "/StudentDel.jsp", "/StudentUpdate.jsp", "/StudentSelect.jsp","/FoodAdd.jsp", "/FoodDel.jsp", "/FoodUpdate.jsp", "/FoodSelect.jsp","/order.jsp", "/OrderDel.jsp", "/OrderUpdate.jsp", "/OrderSelect.jsp","/OrderDetailAdd.jsp", "/OrderDetailDel.jsp", "/OrderDetailUpdate.jsp", "/OrderDetailSelect.jsp","/UserAdd.jsp", "/UserDel.jsp", "/UserUpdate.jsp", "/UserSelect.jsp"})
public class AdminLogin implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        if (session.getAttribute("admin") == null) {
            resp.sendRedirect("Login.jsp");
        } else {
            chain.doFilter(request, response);
        }
    }
}
