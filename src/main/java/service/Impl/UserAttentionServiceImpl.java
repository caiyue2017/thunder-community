package service.Impl;

import dao.UserAttentionDao;
import dao.UserPostDao;
import domain.UserAttention;
import domain.UserPost;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.UserAttentionService;
import service.UserPostService;

import java.util.List;

/**
 * Created by 越 on 2017/3/27.
 */
//将UserServiceImpl类标注为一个service
@Service("userAttentionService")
public class UserAttentionServiceImpl implements UserAttentionService {
    @Autowired
    private UserAttentionDao userAttentionDao;

    @Override
    public UserAttention isAttention(Integer userId, Integer attentionId) {
        return userAttentionDao.isAttention(userId,attentionId);
    }

    @Override
    public int countByUId(Integer id) {
        return userAttentionDao.countByUId(id);
    }

    @Override
    public int countByAId(Integer id) {
        return userAttentionDao.countByAId(id);
    }

    @Override
    public List<UserAttention> findByUserId(Integer id) {
        return userAttentionDao.findByUserId(id);
    }

    @Override
    public List<UserAttention> findByAttentionId(Integer id) {
        return userAttentionDao.findByAttentionId(id);
    }

    @Override
    public void delete(Integer userId, Integer attentionId) {
        userAttentionDao.delete(userId,attentionId);
    }

    @Override
    public void add(Integer userId, Integer attentionId) {
        userAttentionDao.add(userId,attentionId);
    }
}
