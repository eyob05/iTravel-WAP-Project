package edu.miu.cs472.servlet;



import edu.miu.cs472.dao.user.FollowDao;
import edu.miu.cs472.dao.user.IFollowDao;
import edu.miu.cs472.dao.user.IUserDao;
import edu.miu.cs472.dao.user.UserDao;
import edu.miu.cs472.domain.Follow;
import edu.miu.cs472.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/follow")
public class FollowUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User)req.getSession().getAttribute("user");

        long followingid = Long.parseLong(req.getParameter("id"));
        //data access
        IUserDao userDao = new UserDao();
        IFollowDao followDao = new FollowDao();

        Follow follow = new Follow();
        follow.setFollower(user);
        follow.setFollowed(userDao.findById(followingid));
        followDao.create(follow);

        PrintWriter out = resp.getWriter();
        out.write("follow successful");
    }
}