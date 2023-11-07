using Final_DotNet.Infrastructure;
using Final_DotNet.Models;
using Final_DotNet.Repository;
using Microsoft.AspNetCore.Mvc;

namespace Final_DotNet.Controllers
{
    public class AccountController : Controller
    {
        private readonly IUserRepository userRepo;
        private readonly IUserRoleRepository userroleRepo;
        public AccountController(IUserRepository IuserRepo, IUserRoleRepository IuserroleRepo)
        {
            userRepo = IuserRepo;
            userroleRepo = IuserroleRepo;
        }
        public IActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Login(IFormCollection form)
        {
            User? user = userRepo.Login(form["username"], form["password"]);
            if (user != null)
            {
                HttpContext.Session.SetJson("UserLogin", user);
                if (userroleRepo.AuthUserAdmin(user))
                {
                    return RedirectToAction("Index", "Admin");
                }
                TempData["LoginSuccess"] = "Hello " + user.FullName;
                return RedirectToAction("Index", "Home");
            }
            TempData["LoginFailed"] = "Your user or email or password is not correct";
            return View();
        }
        public IActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Register(IFormCollection form)
        {
            User user = new User();
            user.FullName = form["fullname"];
            user.UserName = form["username"];
            user.Password = BCrypt.Net.BCrypt.HashPassword(form["password"]);
            user.Address = form["address"];
            user.Email = form["email"];
            user.Gender = form["gender"];
            user.PhoneNumber = form["phone"];
            bool checkUser = userRepo.Register(user);
            if (checkUser)
            {
                TempData["RegisterSuccess"] = "Register successfully";
                return RedirectToAction("Login");
            }
            return View();
        }
        public IActionResult Information()
        {
            var usersession = HttpContext.Session.GetJson<User>("UserLogin");
            if (usersession != null)
            {
                return View(usersession);
            }
            return RedirectToAction("Login");
        }
        [HttpPost]
        public ActionResult EditInformation(IFormCollection form)
        {
            var user = new User();
            user.UserId = int.Parse(form["userid"]);
            user.FullName = form["fullname"];
            user.UserName = form["username"];
            user.Email = form["email"];
            user.Address = form["address"];
            user.PhoneNumber = form["phone"];
            user.Gender = form["gender"];
            var us = userRepo.updateUser(user);
            HttpContext.Session.SetJson("UserLogin", us);
            TempData["UpdateSuccess"] = "Update information successfully";
            return RedirectToAction("Information");
        }
        [HttpPost]
        public IActionResult ChangePassword(IFormCollection form)
        {
            if (form["newPassword"].Equals(form["confirmNewPassword"]))
            {
                var isSuccess = userRepo.changePassword(int.Parse(form["userid"]), form["currentPassword"], form["newPassword"]);
                if(isSuccess)
                {
                    TempData["ChangePasswordSuccess"] = "Change password successfully";
                    return RedirectToAction("Information");
                }
                else
                {
                    TempData["ChangePasswordFailed"] = "Password is not correct";
                    return RedirectToAction("Information");
                }
            }
            TempData["PasswordNotSameCpassword"] = "The new password is not the same as the confirmation password";
            return RedirectToAction("Information");
        }
        public IActionResult Logout()
        {
            HttpContext.Session.Remove("UserLogin");
            return RedirectToAction("Index", "Home");
        }
    }
}
