using Final_DotNet.Interfaces;
using Final_DotNet.Models;
using System.Numerics;

namespace Final_DotNet.Repository
{
    public class UserRepository : IUserRepository
    {
        private List<User> _users = new List<User>();
        private readonly StoreDbContext dbContext;
        public UserRepository(StoreDbContext db)
        {
            dbContext = db;
        }
        public User FindUserId(int id)
        {
            throw new NotImplementedException();
        }

        public List<User> GetAllUser()
        {
            _users = dbContext.Users.ToList();
            return _users;
        }

        public User Login(string username, string password)
        {
            User? user = dbContext.Users.FirstOrDefault(u => u.UserName.Equals(username.Trim()) && u.Password.Equals(password.Trim()));
            return user;
        }

        public bool Register(User user)
        {
            int isUser = dbContext.Users.Count(u => u.Email.Equals(user.Email) || u.UserName.Equals(user.UserName) || u.PhoneNumber.Equals(user.PhoneNumber));
            if (isUser == 0)
            {
                dbContext.Users.Add(user);
                dbContext.SaveChanges();
                return true;
            }
            return false;
        }
    }
}
