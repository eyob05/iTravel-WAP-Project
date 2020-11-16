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


@WebServlet(name = "editProfileServlet", urlPatterns="/editProfile")
public class EditProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

         String firstName = req.getParameter("fName");
        String middleName = req.getParameter("mname");
        String lastName = req.getParameter("lname");
        String password = req.getParameter("pass");
        String street = req.getParameter("street");
        String city = req.getParameter("city");
        String state = req.getParameter("state");
        String zipcode = req.getParameter("zipcode");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        IUserDao userDao = new UserDao();

        user.setFirstName(firstName);
        user.setMiddleName(middleName);
        user.setLastName(lastName);
        user.setPassword(password);
        user.setStreet(street);
        user.setCity(city);
        user.setState(state);
        user.setZipcode(zipcode);
        userDao.update(user);
         resp.sendRedirect("home.jsp");

    }
}
