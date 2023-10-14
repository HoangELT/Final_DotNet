using Final_DotNet.Models;
using Microsoft.AspNetCore.Mvc;

namespace Final_DotNet.Controllers
{
    public class LoginController : Controller
    {
        private readonly StoreDbContext db;
        public LoginController(StoreDbContext dbcontext)
        {
            db = dbcontext;
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Index(IFormCollection form)
        {
            string username = form["username"];
            string password = form["password"];
            User user = db.Users.FirstOrDefault(u => u.UserName.Equals(username.Trim()));
            if(user != null)
            {
                if (user.Password.Equals(password.Trim()))
                {
                    HttpContext.Session.SetInt32("UserLogin",user.Id);
                    return RedirectToAction("Index", "Home");
                }
            }
            return View();
        }
    }
}
