package edu.miu.cs472.servlet;



import edu.miu.cs472.dao.user.IUserDao;
import edu.miu.cs472.dao.user.UserDao;
import edu.miu.cs472.domain.User;
import edu.miu.cs472.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/followers")
public class FollowersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User)session.getAttribute("user");

        //data access
        IUserDao userDao = new UserDao();
        UserService userService = new UserService();
        List<User> followers = userDao.getUserFollowing(user);
        req.setAttribute("users",followers);
        req.getRequestDispatcher("views/user/followers.jsp").forward(req,resp);
    }
}