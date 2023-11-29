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
        public List<Role> getAllRoles()
        {
            return dbContext.Roles.ToList();
        }
    }
}
