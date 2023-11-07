using Final_DotNet.Data;
using Final_DotNet.Models;
using Final_DotNet.Repository;
using Microsoft.EntityFrameworkCore;

namespace Final_DotNet.Service
{
    public class ReviewService : IReviewRepository
    {
        private readonly StoreDbContext dbContext;
        public ReviewService(StoreDbContext dbContext) { 
            this.dbContext = dbContext;
        }
        public void addReview(int userID, int productId, int rating, string comment)
        {
            dbContext.Reviews.Add(new Review(userID, productId, rating, comment));
            dbContext.SaveChanges();
        }

        public List<Review> getAllReviewbyproductId(int productId)
        {
            var list  = dbContext.Reviews.Include(p=>p.User).Include(p=>p.Product).Where(p=>p.ProductId== productId).ToList();
            if(list.Count > 0)
            {
                return list;
            }
            return null;
        }

        public Review getReview(int productId, int userId)
        {
            var review = dbContext.Reviews.Where(p => p.UserId == userId && p.ProductId == productId).FirstOrDefault();
            return review;
        }

        public void removeReview(int reviewId)
        {
            dbContext.Reviews.Remove(dbContext.Reviews.Find(reviewId));
            dbContext.SaveChanges();
        }

        public double totalProductRating(int productId)
        {
            double totalRating = 0;
            var review = dbContext.Reviews.Where(p=>p.ProductId==productId).ToList();
            if (review != null)
            {
                int totalreview = totalReview(productId);
                foreach (var item in review)
                {
                    totalRating += item.Rating;
                }
                return totalRating / totalreview;
            }
            return 0;
        }

        public int totalReview(int productId)
        {
            var review = dbContext.Reviews.Count(p => p.ProductId == productId);
            return review;
        }

        public void updateReview(Review review)
        {
            var rev = dbContext.Reviews.Find(review.ReviewId);
            if (rev != null)
            {
                rev.Comment = review.Comment;
                rev.Rating = review.Rating;
                dbContext.Reviews.Update(rev);
                dbContext.SaveChanges();
            }
        }
    }
}
