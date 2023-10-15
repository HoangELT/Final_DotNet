using Final_DotNet.Models;

namespace Final_DotNet.Interfaces
{
    public interface IUserRepository
    {
        public List<User> GetAllUser();
        public User FindUserId(int id);
        public User Login(string username, string password);
        public bool Register(User user);
    }
}
