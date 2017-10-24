package domain;

import java.util.Date;

/**
 * Created by 阿越 on 2017/4/21.
 */
public class Post {
    private int id;
    private String author;
    private Date time;
    private String title;
    private String content;
    private int userId;
    private int sectionId;
    private String isTop;
    private String isGood;
    private String isDelete;
    private int browseNum;
    private int reviewNum;
    private String lastReviewUN;
    private Date lastReviewT;
    private int upNum;
    private int storeNum;

    @Override
    public String toString() {
        return "Post{" +
                "id=" + id +
                ", author='" + author + '\'' +
                ", time=" + time +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", userId=" + userId +
                ", sectionId=" + sectionId +
                ", isTop='" + isTop + '\'' +
                ", isGood='" + isGood + '\'' +
                ", isDelete='" + isDelete + '\'' +
                ", browseNum=" + browseNum +
                ", reviewNum=" + reviewNum +
                ", lastReviewUN='" + lastReviewUN + '\'' +
                ", lastReviewT=" + lastReviewT +
                ", upNum=" + upNum +
                ", storeNum=" + storeNum +
                '}';
    }

    public int getUpNum() {
        return upNum;
    }

    public void setUpNum(int upNum) {
        this.upNum = upNum;
    }

    public int getStoreNum() {
        return storeNum;
    }

    public void setStoreNum(int storeNum) {
        this.storeNum = storeNum;
    }

    public int getReviewNum() {
        return reviewNum;
    }

    public void setReviewNum(int reviewNum) {
        this.reviewNum = reviewNum;
    }

    public String getLastReviewUN() {
        return lastReviewUN;
    }

    public void setLastReviewUN(String lastReviewUN) {
        this.lastReviewUN = lastReviewUN;
    }

    public Date getLastReviewT() {
        return lastReviewT;
    }

    public void setLastReviewT(Date lastReviewT) {
        this.lastReviewT = lastReviewT;
    }

    public int getBrowseNum() {
        return browseNum;
    }

    public void setBrowseNum(int browseNum) {
        this.browseNum = browseNum;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }

    public String getIsGood() {
        return isGood;
    }

    public void setIsGood(String isGood) {
        this.isGood = isGood;
    }

    public String getIsTop() {

        return isTop;
    }

    public void setIsTop(String isTop) {
        this.isTop = isTop;
    }

    public Post() {
    }

    public int getSectionId() {
        return sectionId;
    }

    public void setSectionId(int sectionId) {
        this.sectionId = sectionId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

}
