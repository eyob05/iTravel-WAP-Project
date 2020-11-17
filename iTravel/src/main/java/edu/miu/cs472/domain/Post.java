package edu.miu.cs472.domain;


import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "POSTS")
public class Post implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private long id;

    @Column(name = "DETAILS")
    private String details;

    @OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "Photo_ID")
    private Photo photo;

    @Column(name = "TIME")
    private LocalDateTime time;

    @Column(name = "LIKES")
    private int likes;

    @Column(name = "ENABLED")
    private Boolean enabled;

    @OneToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "USER_ID")
    private User user;


    @Transient
    private List<Comment> comments = new ArrayList<>();

    public Post() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public Photo getPhoto() {
        return photo;
    }

    public void setPhoto(Photo photo) {
        this.photo = photo;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public LocalDateTime getTime() {
        return time;
    }
    public int getLikes() {return likes;    }

    public void setLikes(int likes) {this.likes = likes;    }
    public void setTime(LocalDateTime time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Post{" +
                "id=" + id +
                ", details='" + details + '\'' +
                ", photo='" + photo + '\'' +
                ", time=" + time +
                ", user=" + user +
                ", enabled=" + enabled +
                '}';
    }


}
