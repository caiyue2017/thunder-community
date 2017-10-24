package domain;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by 阿越 on 2017/5/1.
 */
public class Review {
    private int id;
    private int userId;
    private int postId;
    private Date time;
    private String content;
    private String username;
    private String img;

    @Override
    public String toString() {
        return "Review{" +
                "id=" + id +
                ", userId=" + userId +
                ", postId=" + postId +
                ", time=" + time +
                ", content='" + content + '\'' +
                ", username='" + username + '\'' +
                ", img='" + img + '\'' +
                '}';
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
