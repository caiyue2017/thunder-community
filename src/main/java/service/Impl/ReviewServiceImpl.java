package service.Impl;

import dao.PostDao;
import dao.ReviewDao;
import domain.Post;
import domain.Review;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.PostService;
import service.ReviewService;

import java.util.List;

/**
 * Created by 越 on 2017/3/27.
 */
//将UserServiceImpl类标注为一个service
@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
    @Autowired
    private ReviewDao rDao;

    public void addReview(Review review) {
        rDao.addReview(review);
    }

    public List<Review> findReviewsByPostId(int postId) {
        return rDao.findReviewsByPostId(postId);
    }

    public List<Review> findReviewOrderByTime() {
        return rDao.findReviewOrderByTime();
    }

    public void deleteById(int id) {
        rDao.deleteById(id);
    }

    @Override
    public List<Review> findReviewsByPostIdAndUserId(Integer postId, String userId) {
        return rDao.findReviewsByPostIdAndUserId(postId,userId);
    }

    @Override
    public List<Review> findReviewsByUserId(int userId) {
        return rDao.findReviewsByUserId(userId);
    }
}
