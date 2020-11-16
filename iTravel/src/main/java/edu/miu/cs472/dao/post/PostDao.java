package edu.miu.cs472.dao.post;



import edu.miu.cs472.dao.GenericJpaDao;
import edu.miu.cs472.domain.Post;
import edu.miu.cs472.domain.User;

import javax.persistence.Query;
import java.util.List;

public class PostDao extends GenericJpaDao<Long, Post> implements IPostDao {

    public PostDao(){
        entityClass = Post.class;
    }

    @Override
    public List<Post> getPostsUserHome(User userId) {
        String uid = ""+userId.getId();
        String sql = "SELECT distinct POSTS.* from FOLLOW,POSTS where  (POSTS.USER_ID = FOLLOW.follower_ID and FOLLOW.followed_ID = " + uid+ " ) or POSTS.USER_ID = " + uid+ " ORDER BY POSTS.TIME desc";
        Query q = manager.createNativeQuery(sql,Post.class);
        List<Post> posts = q.getResultList();
        return posts;
    }

    @Override
    public List<Post> getPostsUserHomePaged(User userId, Integer start, Integer interval) {
        return null;
    }

    @Override
    public List<Post> getPostsByUser(User user) {
        String uid = ""+ user.getId();
        String sql = "SELECT  POSTS.* from POSTS where POSTS.USER_ID = " + uid+ " ORDER BY POSTS.TIME desc";
        Query q = manager.createNativeQuery(sql,Post.class);
        List<Post> posts = q.getResultList();
        return posts;
    }
}
