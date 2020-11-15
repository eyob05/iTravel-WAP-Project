package edu.miu.cs472.servlet;

import edu.miu.cs472.dao.user.IUserDao;
import edu.miu.cs472.dao.user.UserDao;
import edu.miu.cs472.domain.User;


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

    }
    public void deactivateUser(String email, IUserDao userDao){
        User userObj = null;
        List<User> users = userDao.findAll();

        for(User user : users ){
            if (user.getEmail().equals(email.trim()))
                userObj = user;
        }
        if(userObj != null){
            userObj.setActive(Boolean.FALSE);
            userDao.create(userObj);
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String pass = req.getParameter("password");
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
        if(passCorrect && !userObj.isActive()){
            resp.getWriter().write("3");
        }
        else if(passCorrect && userObj.isActive()) {
            HttpSession session = req.getSession();
            session.setAttribute("username", email);
            session.setAttribute("password", pass);
            session.setAttribute("authenticated", userObj);

            resp.getWriter().write("PASS");
        }
        else {

            for (Cookie cookie : req.getCookies()) {
                String count = "";
                if (cookie.getName().equals("count")) {
                    count = cookie.getValue().trim();
                    if(count.equals("2"))
                    {
                        count = "3";
                        System.out.println("DEACTIVATING USER");
                        cookie.setValue(count);
                        resp.addCookie(cookie);
                        deactivateUser(email, userDao);

                    }
                    else if(count.equals("1")){
                        count = "2";
                        cookie.setValue(count);
                        resp.addCookie(cookie);
                    }
                    else if(count.equals("3")){
                        count = "3";
                        cookie.setValue(count);
                        resp.addCookie(cookie);
                    }
                } else {
                    count = "1";
                    Cookie tries = new Cookie("count", count);
                    tries.setMaxAge(60*10);
                    resp.addCookie(tries);
                }
                resp.setContentType("text/plain");
                resp.setCharacterEncoding("UTF-8");
                resp.getWriter().write(count);
            }
        }
    }
}


