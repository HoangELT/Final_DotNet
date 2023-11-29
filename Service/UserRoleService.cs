using Final_DotNet.Data;
using Final_DotNet.Models;
using Final_DotNet.Repository;

namespace Final_DotNet.Service
{
    public class UserRoleService : IUserRoleRepository
    {
        private readonly StoreDbContext dbContext;
        public UserRoleService(StoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public bool AuthUserAdmin(User user)
        {
            var us = dbContext.UserRoles.FirstOrDefault(u => u.UserId == user.UserId);

            if (us != null)
            {
                if (us.RoleId == 1) //admin
                {
                    return true;
                }
            }
            return false;
        }

        public void updateRoleUser(int userId, int RoleId)
        {
            var userRole = dbContext.UserRoles.Where(x => x.UserId == userId).FirstOrDefault();
            if(userRole!=null)
            {
                userRole.RoleId = RoleId;
                dbContext.UserRoles.Update(userRole);
                dbContext.SaveChanges();
            }
            
        }
    }
}
