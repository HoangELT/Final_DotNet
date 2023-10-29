using Final_DotNet.Models;

namespace Final_DotNet.Repository
{
    public interface IUserRepository
    {
        public List<User> GetAllUser();
        public User FindUserbyId(int id);
        public User Login(string username, string password);
        public bool Register(User user);
        public int totalUser();
    }
}
