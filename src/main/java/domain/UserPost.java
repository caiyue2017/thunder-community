package domain;

/**
 * Created by 阿越 on 2017/5/17.
 */
public class UserPost {
    private int userId;
    private int postId;
    private String isUp;
    private String isStore;

    @Override
    public String toString() {
        return "UserPost{" +
                "userId=" + userId +
                ", postId=" + postId +
                ", isUp='" + isUp + '\'' +
                ", isStore='" + isStore + '\'' +
                '}';
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getIsUp() {
        return isUp;
    }

    public void setIsUp(String isUp) {
        this.isUp = isUp;
    }

    public String getIsStore() {
        return isStore;
    }

    public void setIsStore(String isStore) {
        this.isStore = isStore;
    }
}
