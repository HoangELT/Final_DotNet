using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc;

namespace Final_DotNet.Service.Auth
{
    public class AdminAccessFilter : ActionFilterAttribute
    {
        private readonly AuthService authService;

        public AdminAccessFilter(AuthService authService)
        {
            this.authService = authService;
        }

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            var isUserAdmin = authService.isUserAdmin();

            // Kiểm tra đường dẫn của Controller
            if (context.RouteData.Values["controller"] as string == "Admin" && !isUserAdmin)
            {
                context.Result = new RedirectResult("/Home/Index"); // Chuyển hướng về trang chính
            }
        }
    }
}
