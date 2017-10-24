package dao;

import domain.Post;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * Created by 阿越 on 2017/4/21.
 */
public interface PostDao {
    // 添加帖子
    void addPost(Post post);
    // 查找某个版块的所有帖子
    List<Post> findPostsBySID(int sectionId);
    // 找到对应的帖子
    Post findPostById(int id);

    void updatePostTop(@Param("isTop") String isTop, @Param("id") int id);

    void updatePostGood(@Param("isGood")String isGood, @Param("id")int id);

    List<Post> findPostsByWord(@Param("word")String word);

    void deletePostById(@Param("id")int id);

    void AddOneBrowseRecord(@Param("id") int id);

    void setLastUsernameAndTime(@Param("id")Integer postId, @Param("username")String username, @Param("time")Date time);

    void reduceUpNum(@Param("id") int id);

    void addUpNum(@Param("id") int id);

    void reduceStoreNum(@Param("id") int id);
    void addStoreNum(@Param("id") int id);

    List<Post> findPostsOrderByBrowseNum();

    List<Post> findPostsOrderByReviewNum();

    List<Post> findAllPosts();

    List<Post> findTodayPosts();

    int findPostsByUId(@Param("userId") Integer id);

    List<Post> findPostsByUserId(@Param("userId") int userId);
}
