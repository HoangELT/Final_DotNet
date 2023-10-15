using Final_DotNet.Models;
using Microsoft.AspNetCore.Mvc;
using Final_DotNet.Interfaces;

namespace Final_DotNet.Controllers
{
    public class RegisterController : Controller
    {
        private readonly IUserRepository IuserRepo;
        public RegisterController(IUserRepository IuserRepository) {
            IuserRepo = IuserRepository;
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Index(IFormCollection form)
        {
            User user = new User();
            user.FullName = form["fullname"];
            user.UserName = form["username"];
            user.Password = form["password"];
            user.Address = form["address"];
            user.Email = form["email"];
            user.PhoneNumber = form["phone"];
            bool checkUser = IuserRepo.Register(user);
            if (checkUser)
            {
                TempData["Register"] = true;
                return RedirectToAction("Index", "Login");
            }
            return View();
        }
    }
}
