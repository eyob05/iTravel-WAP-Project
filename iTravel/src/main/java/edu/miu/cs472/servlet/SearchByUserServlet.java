package edu.miu.cs472.servlet;

import com.mysql.cj.xdevapi.Session;
import edu.miu.cs472.dao.post.IPostDao;
import edu.miu.cs472.dao.post.PostDao;
import edu.miu.cs472.dao.user.IUserDao;
import edu.miu.cs472.dao.user.UserDao;
import edu.miu.cs472.domain.Post;
import edu.miu.cs472.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@WebServlet(urlPatterns = "/searchbyuser")
public class SearchByUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Its on the search doPost ");
        String userString = req.getParameter("searchuser");
        System.out.println(userString);
        IUserDao userDao = new UserDao();
        List<User>  users = userDao.findAll();
        List<User> newListOfUsers = new ArrayList<>();

        for (User user:users){
            if(user.getFirstName().contains(userString) || user.getLastName().contains(userString)) {
                newListOfUsers.add(user);
                System.out.println(user.getFirstName());
            }
        }

        IPostDao postDao = new PostDao();
        List<List<Post>> posts = new ArrayList<>();
        for (User user:newListOfUsers){
            List<Post> postList = postDao.getPostsByUser(user);
            posts.add(postList);
        }

        List<Post> postListAfterStream = posts.stream()
                                       .flatMap(post -> post.parallelStream())
                                        .collect(Collectors.toList());

         req.setAttribute("posts",postListAfterStream);
         req.getRequestDispatcher("searchUser.jsp").forward(req,resp);

    }
}
