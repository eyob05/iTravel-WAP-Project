package edu.miu.cs472.servlet;

import edu.miu.cs472.dao.post.INotificationDao;
import edu.miu.cs472.dao.post.NotificationDao;
//import edu.miu.cs472.domain.Advertisement;
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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "home", urlPatterns = "/home")
public class HomeServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(HomeServlet.class.getName());
    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp){
        try {
            HttpSession session = req.getSession();
            PostService postService = new PostService();
            INotificationDao notificationDao = new NotificationDao();

            User user;

            if (session != null) {
                user = (User) session.getAttribute("authenticated");
                req.setAttribute("user", user);
                UserService userService = new UserService();
                List<User> usersNearBy = userService.getUserNearBy(user);
                IUserDao userDao = new UserDao();
                List<User> followers = userDao.getUserFollowers(user);
                session.setAttribute("usersNearBy", usersNearBy);
                session.setAttribute("user",user);
                session.setAttribute("notifications",notificationDao.findAll());
                session.setAttribute("posts",postService.getPostsUserHome(user));
                session.setAttribute("followers", followers);
                RequestDispatcher rd = req.getRequestDispatcher("home.jsp");


                rd.forward(req, resp);
            } else {
                resp.sendRedirect("/");
            }
        }catch (Exception ex){
            LOGGER.log(Level.SEVERE, ex.getMessage());
            System.err.println(ex.getMessage());
        }

    }
}