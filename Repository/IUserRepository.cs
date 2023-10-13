using Final_DotNet.Models;

namespace Final_DotNet.Repository
{
    public interface IUserRepository
    {
        public List<User> GetAllUser();
        public User FindUserId(int id);
    }
}
