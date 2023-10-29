using Final_DotNet.Data;
using Final_DotNet.Models;
using Final_DotNet.Repository;

namespace Final_DotNet.Service
{
    public class RoleService : IRoleRepository
    {
        private readonly StoreDbContext dbContext;
        public RoleService(StoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }
        public void updateRoleUser(int userId, int RoleId)
        {
            var userRole = dbContext.UserRoles.Where(x => x.UserId == userId).Select(x => x).ToList();
            foreach(var role in userRole)
            {
                role.RoleId = RoleId;
                dbContext.UserRoles.Update(role);
                dbContext.SaveChanges();
            }
            
        }
    }
}
