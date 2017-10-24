package service.Impl;

import dao.PostDao;
import dao.UserDao;
import domain.Post;
import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.PostService;
import service.UserService;

import java.util.Date;
import java.util.List;
import java.util.Set;

/**
 * Created by 越 on 2017/3/27.
 */
//将UserServiceImpl类标注为一个service
@Service("postService")
public class PostServiceImpl implements PostService {
    @Autowired
    private PostDao pDao;

    public void addPost(Post post) {
        pDao.addPost(post);
    }

    public List<Post> findPostsBySID(int sectionId) {
        return pDao.findPostsBySID(sectionId);
    }

    public Post findPostById(int id) {
        return pDao.findPostById(id);
    }

    public void updatePostTop(String isTop,int id) {
        pDao.updatePostTop(isTop,id);
    }

    public void updatePostGood(String isGood, int id) {
        pDao.updatePostGood(isGood,id);
    }

    public List<Post> findPostsByWord(String word) {
        return pDao.findPostsByWord(word);
    }

    public void deletePostById(int id) {
        pDao.deletePostById(id);
    }

    public void AddOneBrowseRecord(int id) {
        pDao.AddOneBrowseRecord(id);
    }

    public void setLastUsernameAndTime(Integer postId, String username, Date time) {
        pDao.setLastUsernameAndTime(postId,username,time);
    }

    public void setUpNum(String isUp,int id) {
        if (isUp.equals("false"))
            pDao.reduceUpNum(id);
        else
            pDao.addUpNum(id);
    }

    public void setStoreNum(String isStore, int id) {
        if (isStore.equals("false"))
            pDao.reduceStoreNum(id);
        else
            pDao.addStoreNum(id);
    }

    public List<Post> findPostsOrderByBrowseNum() {
        return pDao.findPostsOrderByBrowseNum();
    }

    public List<Post> findPostsOrderByReviewNum() {
        return pDao.findPostsOrderByReviewNum();
    }

    @Override
    public List<Post> findAllPosts() {
        return pDao.findAllPosts();
    }

    @Override
    public List<Post> findTodayPosts() {
        return pDao.findTodayPosts();
    }

    @Override
    public int findPostsByUId(Integer id) {
        return pDao.findPostsByUId(id);
    }

    @Override
    public List<Post> findPostsByUserId(int userId) {
        return pDao.findPostsByUserId(userId);
    }
}
