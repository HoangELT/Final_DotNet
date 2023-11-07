using Final_DotNet.Models;
using Final_DotNet.Repository;
using Final_DotNet.Infrastructure;
using Microsoft.AspNetCore.Http;

namespace Final_DotNet.Service.Auth
{
    public class AuthService
    {
        private readonly IUserRoleRepository userroleRepository;
        private readonly IHttpContextAccessor httpContextAccessor;
        public AuthService(IUserRoleRepository userroleRepository, IHttpContextAccessor httpContextAccessor)
        {
            this.userroleRepository = userroleRepository;
            this.httpContextAccessor = httpContextAccessor;
        }
        public bool isUserAdmin()
        {
            var httpContext = httpContextAccessor.HttpContext;
            var user = httpContext.Session.GetJson<User>("UserLogin");
            if (user != null)
            {
                if (userroleRepository.AuthUserAdmin(user))
                {
                    return true;
                }
            }
            return false;
        }
    }
}
