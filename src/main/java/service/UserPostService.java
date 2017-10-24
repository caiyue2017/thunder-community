package service;

import domain.UserPost;

import java.util.List;


/**
 * Created by 越 on 2017/3/27.
 */
public interface UserPostService {

    UserPost find(Integer userId, Integer postId);

    void setIsUp(String isUp,int userId,int postId);
    void setIsStore(String isStore,int userId,int postId);

    void add(Integer id, Integer postId);

    List<Integer> findUserStores(Integer id);
}
