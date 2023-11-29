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
            var user = dbContext.Users.Include(p=>p.Roles).Include(p=>p.Orders).Where(p=>p.UserId==id).FirstOrDefault();
            if (user != null)
            {
                return user;
            }
            return null;
        }

        public List<User> GetAllUser()
        {
            listusers = dbContext.Users.Include(p=>p.Orders).Include(p=>p.Roles).ToList();
            return listusers;
        }

        public User Login(string username, string password)
        {
            var user = dbContext.Users.FirstOrDefault(u => u.UserName.Equals(username.Trim()) || u.Email.Equals(username.Trim()));
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

        public User updateUser(User user)
        {
            var us = dbContext.Users.Find(user.UserId);
            if (us != null)
            {
                us.Address = user.Address;
                us.PhoneNumber = user.PhoneNumber;
                us.FullName = user.FullName;
                us.Email = user.Email;
                us.UserName = user.UserName;
                us.Gender = user.Gender;
                dbContext.Users.Update(us);
                dbContext.SaveChanges();
                return us;
            }
            return null;
        }

        public bool forgotPassword(int userId, string newpassword)
        {
            var us = dbContext.Users.Where(p=>p.UserId== userId).FirstOrDefault();
            if(us != null)
            {
                us.Password = BCrypt.Net.BCrypt.HashPassword(newpassword);
                dbContext.Update(us);
                dbContext.SaveChanges();
                return true;
            }
            return false;
        }
        public User sendEmail(string email)
        {
            var user = dbContext.Users.Where(p => p.Email.Equals(email)).FirstOrDefault();
            if (user != null)
            {
                return user;
            }
            return null;
        }

        public bool changePassword(int userId, string oldpassword, string newpassword)
        {
            var user = dbContext.Users.Find(userId);
            bool isPassword = BCrypt.Net.BCrypt.Verify(oldpassword.Trim(), user.Password);
            if (user != null && isPassword)
            {
                user.Password = BCrypt.Net.BCrypt.HashPassword(newpassword);
                dbContext.Users.Update(user);
                dbContext.SaveChanges();
                return true;
            }
            return false;
        }
    }
}
