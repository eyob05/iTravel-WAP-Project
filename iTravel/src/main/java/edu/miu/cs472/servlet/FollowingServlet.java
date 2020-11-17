package edu.miu.cs472.servlet;



import edu.miu.cs472.dao.user.IUserDao;
import edu.miu.cs472.dao.user.UserDao;
import edu.miu.cs472.domain.User;
import edu.miu.cs472.service.PostService;
import edu.miu.cs472.service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/following")
public class FollowingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long userId = Long.parseLong(req.getParameter("rf"));

        //data access
        IUserDao userDao = new UserDao();
        UserService userService = new UserService();
        User user = userDao.findById(userId);
        List<User> followers = userDao.getUserFollowers(user);

        req.getSession().setAttribute("followers",followers);
        req.setAttribute("user", user);
        req.getRequestDispatcher("following.jsp").forward(req,resp);
    }
}

