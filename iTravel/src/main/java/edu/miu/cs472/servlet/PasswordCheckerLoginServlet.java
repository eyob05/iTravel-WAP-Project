package edu.miu.cs472.servlet;

import edu.miu.cs472.dao.user.IUserDao;
import edu.miu.cs472.dao.user.UserDao;
import edu.miu.cs472.domain.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name="passwordChecker", urlPatterns = "/passwordChecker")
public class PasswordCheckerLoginServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(edu.miu.cs472.LoginServlet.class.getName());
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {

        try {
            resp.sendRedirect("/home");
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String pass = req.getParameter("password");
        System.out.println(email + " " + pass);
        User userObj=null;
        IUserDao userDao = new UserDao();
        List<User> users = userDao.findAll();
        boolean passCorrect = false;

        for (User user : users) {
            if (user.getEmail().equals(email.trim())
                    && user.getPassword().equals(pass.trim())) {
                userObj = user;
                passCorrect = true;
                break;
            }
        }

        if(passCorrect) {
            //RequestDispatcher reqDesp = req.getRequestDispatcher("login");
            //reqDesp.forward(req, resp);
            Cookie[] cookie = req.getCookies();
            cookie[0].setMaxAge(0);
            resp.addCookie(cookie[0]);
            HttpSession session = req.getSession();
            session.setAttribute("authenticated", userObj);
            req.setAttribute("user", userObj);
            resp.sendRedirect("/profile.html");
        }else {
            int cookieCount = 0;
            for (Cookie cookie : req.getCookies()) {
                System.out.println(cookie.getValue() + " our cookie value");
                if (cookie.getName().equals("count")) {
                    cookieCount = Integer.parseInt(cookie.getValue().trim());
                    cookie.setValue("" + ++cookieCount);
                    System.out.println("we had cookie set: " + cookieCount);
                    resp.addCookie(cookie);
                }else {
                    Cookie tries = new Cookie("count", "1");
                    tries.setMaxAge(60 * 60 * 24);
                    cookieCount++;
                    resp.addCookie(tries);
                    System.out.println("we made new cookie : " + cookieCount);
                }
                resp.setContentType("text/plain");
                resp.setCharacterEncoding("UTF-8");
                resp.getWriter().write(cookieCount + "");
            }
        }
    }
}


