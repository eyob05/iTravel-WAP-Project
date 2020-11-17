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
import java.util.List;

@WebServlet("/unfollow")
public class UnfollowUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User user = (User) (req.getSession().getAttribute("user"));
        System.out.println("inside doPost method of Unfoollow" + user.getFirstName());

        Long followerId = user.getId();
        long followingId = Long.parseLong(req.getParameter("id"));
        //data access
        IFollowDao followDao = new FollowDao();
        System.out.println("User to be unfollowed: " + followingId);
        List<Follow> follows = followDao.findAll();
        Follow unfollow = null;

        for (Follow follow : follows) {
            if ((follow.getFollower().getId() == followerId) && (follow.getFollowed().getId() == followingId)) {
                System.out.println("Found unfollowed!");
                unfollow = follow;
            }
        }
        followDao.delete(unfollow);

        PrintWriter out = resp.getWriter();
        out.write("unfollow successful");

    }
}