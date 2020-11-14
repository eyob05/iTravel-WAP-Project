package edu.miu.cs472.domain;


import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name = "USERS")
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private long id;

    @Column(name = "FIRST_NAME", nullable = true)
    private String firstName;

    @Column(name = "MIDDLE_NAME", nullable = true)
    private String middleName;

    @Column(name = "LAST_NAME", nullable = true)
    private String lastName;

    @Column(name = "STREET", nullable = true)
    private String street;

    @Column(name = "CITY", nullable = true)
    private String city;

    @Column(name = "STATE", nullable = true)
    private String state;

    @Column(name = "ZIPCODE", nullable = true)
    private String zipcode;

    @Column(name = "EMAIL", nullable = true)
    private String email;

    @Column(name = "PASSWORD", nullable = true)
    private String password;

    @Column(name = "GENDER", nullable = true)
    private String gender;

    @Column(name = "ACCESS", nullable = true)
    private String access;

    @Column(name = "PHOTOLINK", nullable = true )
    private String photoLink = "assets/images/profile/male.png";

    @Column(name = "TIMELINELINK", nullable = true)
    private String timelinePhotoLink = "assets/images/banner/profile-banner.jpg";

    @Transient
    private List<Post> posts = new ArrayList<>();

    @Column(name = "ACTIVE")
    private boolean active = Boolean.TRUE;

    @Column(name = "LOGGED_IN")
    private boolean loggedIn;

    @Transient
    List<User> followers = new ArrayList<>();

    @Transient
    List<User> following = new ArrayList<>();


    public User() {
    }

    public User(String firstName, String middleName , String lastName, String street, String city, String state, String zipcode, String email, String password, String gender ,String access) {
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.street = street;
        this.city = city;
        this.state = state;
        this.zipcode = zipcode;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.access=access;
    }

    public long getId() {
        return id;
    }
    public void setPhotoLink( String photoLink ){ this.photoLink = photoLink; }
    public String getPhotoLink(){ return photoLink; }

    public void setTimelinePhotoLink( String timelinePhotoLink ){ this.timelinePhotoLink = timelinePhotoLink; }
    public String getTimelinePhotoLink(){ return timelinePhotoLink; }

    public void setId(long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAccess() {
        return access;
    }

    public void setAccess(String access) {
        this.access = access;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public List<Post> getPosts() {
        return posts;
    }

    public void setPosts(List<Post> posts) {
        this.posts = posts;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public boolean isLoggedIn() {
        return loggedIn;
    }

    public void setLoggedIn(boolean loggedIn) {
        this.loggedIn = loggedIn;
    }


    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    public List<User> getFollowers() {
        return followers;
    }

    public void setFollowers(List<User> followers) {
        this.followers = followers;
    }

    public List<User> getFollowing() {
        return following;
    }

    public void setFollowing(List<User> following) {
        this.following = following;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +

                ", password='" + password + '\'' +
                ", access='" + access + '\'' +
                ", city='" + city + '\'' +

                ", posts=" + posts +
                ", gender='" + gender + '\'' +
                ", active=" + active +
                ", loggedIn=" + loggedIn +

                ", followers=" + followers +
                ", following=" + following +
                '}';
    }
}
