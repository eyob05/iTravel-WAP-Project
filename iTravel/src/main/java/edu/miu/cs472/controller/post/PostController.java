package edu.miu.cs472.controller.post;



import edu.miu.cs472.dao.GenericJpaDao;
import edu.miu.cs472.dao.post.PostDao;
import edu.miu.cs472.domain.Post;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(urlPatterns = "/posts")
public class PostController extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(PostController.class.getName());
    private GenericJpaDao<Long, Post> dao;
    public PostController(){
        dao = new PostDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try{
            List<Post> posts = dao.findAll();
        }catch (Exception ex){
            LOGGER.log(Level.SEVERE, ex.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request,HttpServletResponse response){
        String id=request.getParameter("likes");
        long i= Long.parseLong(id);
        PostDao postDao=new PostDao();
        Post post=postDao.findById(i);
        post.setLikes(post.getLikes()+1);
        postDao.create(post);




    }


}
