package service.Impl;

import dao.UserDao;
import dao.UserPostDao;
import domain.UserPost;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.UserPostService;

import java.util.List;

/**
 * Created by 越 on 2017/3/27.
 */
//将UserServiceImpl类标注为一个service
@Service("userPostService")
public class UserPostServiceImpl implements UserPostService {
    @Autowired
    private UserPostDao userPostDao;

    public UserPost find(Integer userId, Integer postId) {

        return userPostDao.find(userId, postId);
    }

    public void setIsUp(String isUp, int userId, int postId) {
        userPostDao.setIsUp(isUp, userId, postId);
    }

    public void setIsStore(String isStore, int userId, int postId) {
        userPostDao.setIsStore(isStore, userId, postId);
    }

    @Override
    public void add(Integer id, Integer postId) {
        userPostDao.
                add(id, postId);
    }

    @Override
    public List<Integer> findUserStores(Integer id) {
        return userPostDao.findUserStores(id);
    }
}
