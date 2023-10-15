using Final_DotNet.Models;
using Microsoft.AspNetCore.Mvc;
using Final_DotNet.Interfaces;

namespace Final_DotNet.Controllers
{
    public class LoginController : Controller
    {
        private readonly IUserRepository IuserRepo;
        public LoginController(IUserRepository IuserRepository)
        {
            IuserRepo = IuserRepository;
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Index(IFormCollection form)
        {
            User? user = IuserRepo.Login(form["username"], form["password"]);
            if (user != null)
            {
                HttpContext.Session.SetInt32("UserLogin", user.Id);
                return RedirectToAction("Index", "Home");
            }
            return View();
        }
    }
}
