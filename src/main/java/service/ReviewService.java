package service;

import domain.Review;

import java.util.List;

/**
 * Created by 阿越 on 2017/5/1.
 */
public interface ReviewService {
    void addReview(Review review);
    List<Review> findReviewsByPostId(int id);

    List<Review> findReviewOrderByTime();

    void deleteById(int id);

    List<Review> findReviewsByPostIdAndUserId(Integer postId, String userId);

    List<Review> findReviewsByUserId(int userId);
}
