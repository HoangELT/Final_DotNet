using Final_DotNet.Models;

namespace Final_DotNet.Repository
{
    public interface IReviewRepository
    {
        public void addReview(int userID, int productId, int rating, string comment);
        public void removeReview(int reviewId);
        public void updateReview(Review review);
        public int totalReview(int productId);
        public double totalProductRating(int productId);
        public Review getReview(int productId, int userId);

        public List<Review> getAllReviewbyproductId(int productId);
    }
}
