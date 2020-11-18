package edu.miu.cs472.servlet;

import edu.miu.cs472.dao.post.IPostDao;
import edu.miu.cs472.dao.post.PostDao;
import edu.miu.cs472.domain.Post;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(urlPatterns = "/searchbypost")
public class SearchByPostServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String postString =req.getParameter("searchpost");

        IPostDao postDao = new PostDao();
        List<Post> postList = postDao.findAll();
        List<Post> postsAfterStream = postList.parallelStream()
                                   .filter(post -> post.getDetails().contains(postString))
                                   .collect(Collectors.toList());
        req.setAttribute("posts",postsAfterStream);
        req.getRequestDispatcher("searchPost.jsp").forward(req,resp);

    }
}
