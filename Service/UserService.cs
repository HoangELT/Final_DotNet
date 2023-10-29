using Final_DotNet.Repository;
using Final_DotNet.Models;
using Microsoft.EntityFrameworkCore;
using Final_DotNet.Data;

namespace Final_DotNet.Service
{
    public class UserService : IUserRepository
    {
        private List<User> listusers = new List<User>();
        private readonly StoreDbContext dbContext;
        public UserService(StoreDbContext db)
        {
            dbContext = db;
        }
        public User FindUserbyId(int id)
        {
            var user = dbContext.Users.Where(x => x.UserId == id).Select(x => x);
            return (User)user;
        }

        public List<User> GetAllUser()
        {
            listusers = dbContext.Users.ToList();
            return listusers;
        }

        public User Login(string username, string password)
        {
            var user = dbContext.Users.FirstOrDefault(u => u.UserName.Equals(username.Trim()));
            if (user != null)
            {
                bool isPassword = BCrypt.Net.BCrypt.Verify(password.Trim(), user.Password);
                if (isPassword)
                {
                    return user;
                }
            }
            return null;
        }

        public bool Register(User user)
        {
            int isUser = dbContext.Users.Count(u => u.Email.Equals(user.Email) || u.UserName.Equals(user.UserName) || u.PhoneNumber.Equals(user.PhoneNumber));
            if (isUser == 0)
            {
                dbContext.Users.Add(user);
                dbContext.SaveChanges();
                // default customer = 2, admin = 1
                UserRole userrole = new UserRole(user.UserId, 2);
                dbContext.UserRoles.Add(userrole);
                dbContext.SaveChanges();
                return true;
            }
            return false;
        }

        public int totalUser()
        {
            return dbContext.Users.Count(); ;
        }
    }
}
