package service;

import domain.UserAttention;
import domain.UserPost;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;


/**
 * Created by 越 on 2017/3/27.
 */
public interface UserAttentionService {

    UserAttention isAttention(Integer id, Integer id1);

    int countByUId(Integer id);

    int countByAId(Integer id);

    List<UserAttention> findByUserId(Integer id);

    List<UserAttention> findByAttentionId(Integer id);

    void delete(Integer userId, Integer attentionId);

    void add(Integer userId, Integer attentionId);
}
