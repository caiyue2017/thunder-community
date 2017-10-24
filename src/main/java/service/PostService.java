package service;

import domain.Post;
import domain.User;

import java.util.Date;
import java.util.List;
import java.util.Set;


/**
 * Created by 越 on 2017/3/27.
 */
public interface PostService {

    void addPost(Post post);

    List<Post> findPostsBySID(int sectionId);

    Post findPostById(int id);

    void updatePostTop(String isTop,int id);
    void updatePostGood(String isGood,int id);

    List<Post> findPostsByWord(String word);

    void deletePostById(int i);

    void AddOneBrowseRecord(int id);

    void setLastUsernameAndTime(Integer postId, String username, Date time);

    void setUpNum(String isUp,int id);

    void setStoreNum(String isStore, int postId);

    List<Post> findPostsOrderByBrowseNum();

    List<Post> findPostsOrderByReviewNum();

    List<Post> findAllPosts();

    List<Post> findTodayPosts();

    int findPostsByUId(Integer id);

    List<Post> findPostsByUserId(int i);
}
