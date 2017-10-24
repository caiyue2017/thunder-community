package dao;

import domain.User;
import domain.UserPost;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.access.method.P;

import java.util.List;
import java.util.Set;

public interface UserPostDao {

    UserPost find(@Param("userId") Integer userId, @Param("postId")Integer postId);

    void setIsUp(@Param("isUp") String isUp,@Param("userId")int userId,@Param("postId")int postId);

    void setIsStore(@Param("isStore") String isStore,@Param("userId")int userId,@Param("postId")int postId);

    void add(@Param("userId") Integer id, @Param("postId") Integer postId);

    List<Integer> findUserStores(@Param("userId") Integer id);
}