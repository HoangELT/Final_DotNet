using Final_DotNet.Models;

namespace Final_DotNet.Repository
{
    public interface IUserRoleRepository
    {
        public void updateRoleUser(int userId, int RoleId);
        public bool AuthUserAdmin(User user);
    }
}
