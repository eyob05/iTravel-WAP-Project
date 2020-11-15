package edu.miu.cs472.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import edu.miu.cs472.dao.user.IUserDao;
import edu.miu.cs472.dao.user.UserDao;
import edu.miu.cs472.domain.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
@WebServlet(name = "checker", urlPatterns = "/emailChecker")
public class EmailCheckerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        System.out.println(email);
        resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");
        boolean isPresent = false;

        IUserDao userDao = new UserDao();
        List<User> users = userDao.findAll();

        for (User user : users) {
            if (user.getEmail().equals(email) ) {
                isPresent = true;
                break;
            }
        }

        resp.getWriter().write(isPresent + "");
        if(!isPresent){
            RequestDispatcher dispatcher = req.getRequestDispatcher("users");
            dispatcher.forward(req,resp);
        }
    }




}
