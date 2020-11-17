package edu.miu.cs472.servlet;

import com.google.gson.Gson;
import edu.miu.cs472.dao.user.IUserDao;
import edu.miu.cs472.dao.user.UserDao;
import edu.miu.cs472.domain.User;
import edu.miu.cs472.service.PostService;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(ProfileServlet.class.getName());
    private IUserDao dao;
    private Gson gson = new Gson();

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        this.dao = new UserDao();
    }

    @Override
    public void init() throws ServletException {
        super.init();
        dao = new UserDao();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            System.out.println("Inside doGet method of Profile servlet");
            User user;
            if (request.getSession() != null) {
                IUserDao userDao = new UserDao();
                PostService postService = new PostService();

                long userId = Long.parseLong(request.getParameter("rf"));

                user = userDao.findById(userId);
                boolean isSelf = false;
                if(user.getId()==  ((User)request.getSession().getAttribute("user")).getId())  {
                    isSelf = true;
                }
                request.setAttribute("isSelf",isSelf);
                request.setAttribute("user", user);
                request.setAttribute("timelinePosts", postService.getPostsByUser(user));
                RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("/");
            }
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            System.out.println("Inside doPost method of Profile servlet");
            HttpSession session = req.getSession();
            User user = userprofile(req);
            session.setAttribute("user", user);
            dao.update(user);
            resp.sendRedirect("profile");
            PrintWriter writer = resp.getWriter();
            String userJsonString = this.gson.toJson(user);
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            writer.print(userJsonString);
            writer.flush();
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, ex.getMessage());
        }


    }

    private User userprofile(HttpServletRequest req) {

        String firstName = req.getParameter("fname");
        String middleName = req.getParameter("mname");
        String lastName = req.getParameter("lname");
        String street = req.getParameter("street");
        String city = req.getParameter("city");
        String state = req.getParameter("state");
        String zipcode = req.getParameter("zipcode");
        String email = req.getParameter("email");
        String password = req.getParameter("pass");
        String gender = req.getParameter("gender");
        String access = "user";
        return new User(firstName,middleName, lastName,street,city,state,zipcode, email, password,gender, access);
    }

}