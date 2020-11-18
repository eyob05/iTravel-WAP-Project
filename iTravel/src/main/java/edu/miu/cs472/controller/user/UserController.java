package edu.miu.cs472.controller.user;

import com.google.gson.Gson;
import edu.miu.cs472.dao.post.INotificationDao;
import edu.miu.cs472.dao.post.NotificationDao;
import edu.miu.cs472.dao.user.IUserDao;
import edu.miu.cs472.dao.user.UserDao;
import edu.miu.cs472.domain.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(urlPatterns = "/users")
public class UserController extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(UserController.class.getName());
    private IUserDao dao;
    private Gson gson = new Gson();

    @Override
    public void init() throws ServletException {
        super.init();
        dao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try{
            List<User> users = dao.findAll();
            //request.getpara
            request.setAttribute("users", users);
            request.getRequestDispatcher("list-users.jsp")
                    .forward(request, response);
            response.sendRedirect("users");
        }catch (Exception ex){
            LOGGER.log(Level.SEVERE, ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        try{
            INotificationDao notificationDao = new NotificationDao();
            User user = userObj(request);

            dao.create(user);
            PrintWriter writer = response.getWriter();
            //user must login automatically
//            String userJsonString = this.gson.toJson(user);
//            response.setContentType("application/json");
//            response.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
            session.setAttribute("username", user.getEmail());
            session.setAttribute("password", user.getPassword());
            session.setAttribute("authenticated", user);

            session.setAttribute("notifications",notificationDao.findAll());
            RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
            rd.forward(request, response);
//            writer.print(userJsonString);
//            writer.flush();
        }catch (Exception ex){
            LOGGER.log(Level.SEVERE, ex.getMessage());
        }
    }

    private User userObj(HttpServletRequest request){
        String firstName = request.getParameter("fname");
        String middleName = request.getParameter("mname");
        String lastName = request.getParameter("lname");
        String street = request.getParameter("street");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zipcode = request.getParameter("zipcode");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String gender = request.getParameter("gender");
        String access = "user";
        return new User(firstName,middleName, lastName,street,city,state,zipcode, email, password,gender, access);
    }
}
