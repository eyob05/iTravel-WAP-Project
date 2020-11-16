package edu.miu.cs472.servlet;


import com.google.gson.Gson;

import edu.miu.cs472.dao.GenericJpaDao;
import edu.miu.cs472.dao.post.IPhotoDao;
import edu.miu.cs472.dao.post.IPostDao;
import edu.miu.cs472.dao.post.PhotoDao;
import edu.miu.cs472.dao.post.PostDao;
import edu.miu.cs472.domain.Photo;
import edu.miu.cs472.domain.Post;
import edu.miu.cs472.domain.User;
import edu.miu.cs472.service.PostService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "addpost",urlPatterns = {"/addPost"})
public class PostServlet extends HttpServlet {
    private  String UPLOAD_DIRECTORY;

    private GenericJpaDao<Long, Post> genericJpaDao = new PostDao();
    private List<Post> posts = new ArrayList<>();



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("1 Reaching the post Servlet");
        UPLOAD_DIRECTORY = req.getServletContext().getInitParameter("imageUploads");
        //String photoDetails= req.getParameter("detail");

        Photo photo = new Photo();
        String photoLink = "";
        Map<String, String> params = new HashMap<>();

        Post post = new Post();
        System.out.println("2 Reaching the post Servlet");
        //process only if its multipart content
        if(ServletFileUpload.isMultipartContent(req)){
            try {
                List<FileItem> multiparts = new ServletFileUpload(
                        new DiskFileItemFactory()).parseRequest(req);
                System.out.println("3 Reaching the post Servlet");
                for(FileItem item : multiparts){
                    if(item.isFormField()) {
                        String name = item.getFieldName();
                        String value = item.getString();
                        params.put(name,value);
                        System.out.println("4 Reaching the post Servlet");
                    }
                    else{
                        String name = new File(item.getName()).getName();
                        // set the photo name
                        photoLink = name;
                        System.out.println(photoLink);
                        photo.setLink(photoLink);
                        item.write( new File(UPLOAD_DIRECTORY + File.separator + photoLink));
                    }
                }
                System.out.println("5 Reaching the post Servlet");
                //File uploaded successfully
                req.setAttribute("message", "File Uploaded Successfully");
            } catch (Exception ex) {
                req.setAttribute("message", "File Upload Failed due to " + ex);
            }

        }else{
            req.setAttribute("message",
                    "Sorry this Servlet only handles file upload request");
        }
        System.out.println("6 Reaching the post Servlet");
        // add post to the database
        HttpSession session = req.getSession();
        User user = (User)session.getAttribute("user");
        post.setDetails(params.get("postDetails"));

        post.setPhoto(photo);
        post.setUser(user);
        post.setTime(LocalDateTime.now());
        post.setEnabled(true);

        // add post to database
        IPostDao postDao = new PostDao();
        IPhotoDao photoDao = new PhotoDao();

        PostService postService = new PostService();
        Post dbPost = postDao.create(post);
        Photo dbPhoto = photoDao.create(photo);
        // send notifications
        postService.addPostNotification(post);
        //post.setUser(new User());
        // save post to database
        //PrintWriter out = resp.getWriter();
        resp.sendRedirect("home.jsp");
        // convert to json
//        Gson gn = new Gson();
//        String postsJson = gn.toJson(postService.getPostsUserHome(user));
//        resp.setContentType("application/json");
//        out.write(postsJson);
        //abstractDao.save(post);


    }

}
