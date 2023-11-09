using Final_DotNet.Infrastructure;
using Final_DotNet.Models;
using Final_DotNet.Repository;
using Final_DotNet.Service.Auth;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using static System.Net.WebRequestMethods;

namespace Final_DotNet.Controllers
{
    public class AccountController : Controller
    {
        private readonly IUserRepository userRepo;
        private readonly IUserRoleRepository userroleRepo;
        private readonly EmailService emailService;
        private readonly ILogger<AccountController> logger;
        public AccountController(ILogger<AccountController> logger,EmailService emailService, IUserRepository IuserRepo, IUserRoleRepository IuserroleRepo)
        {
            userRepo = IuserRepo;
            userroleRepo = IuserroleRepo;
            this.emailService = emailService;
            this.logger= logger;
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
                if (isSuccess)
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
        public IActionResult ForgotPassword()
        {
            return View();
        }

        [HttpPost]
        public IActionResult ForgotPassword(IFormCollection form)
        {
            if (form["password"].Equals(form["Cpassword"]))
            {
                var issuccess = userRepo.forgotPassword(int.Parse(form["userid"]), form["password"]);
                if (issuccess)
                {
                    TempData["ForgotPasswordSuccess"] = "Change password successfully";
                    return RedirectToAction("Login");
                }
            }
            TempData["PasswordNotSameCpassword"] = "The new password is not the same as the confirmation password";
            return View();
        }
        public IActionResult SendEmail()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> SendEmail(IFormCollection form)
        {
            User userF = userRepo.sendEmail(form["email"]);
            logger.LogInformation("haaaaaaaaaaaaaaaaaaaa" + userF.Email);
            if (userF != null)
            {
                TempData["USERID"] = userF.UserId;
                try
                {
                    var toEmail = userF.Email;
                    var VerificationCodeSent = emailService.GenerateVerificationCode();
                    logger.LogInformation("asdasdddddddddd" + VerificationCodeSent);
                    HttpContext.Session.SetString("VerificationCodeSent", VerificationCodeSent);

                    await emailService.SendEmailAsync(toEmail, VerificationCodeSent);
                    return RedirectToAction("VerifyCodeSend");
                }
                catch (Exception ex)
                {
                    // Xử lý khi gửi email thất bại
                    return NotFound("ErrorView" + ex.Message);
                }
            }
            return NotFound("Email is not correct");
        }
        public IActionResult VerifyCodeSend()
        {
            return View();
        }
        [HttpPost]
        public IActionResult VerifyCodeSend(IFormCollection form)
        {
            string verifycode = HttpContext.Session.GetString("VerificationCodeSent");
            if (verifycode != null)
            {
                TempData["userId"] = int.Parse(form["userid"]);
                if (verifycode.Equals(form["verifycode"]))
                {
                    HttpContext.Session.Remove("VerificationCodeSent");
                    return RedirectToAction("ForgotPassword");
                }
                return NotFound("Email is not correct");
            }
            return NotFound("Email is not correct");
        }
    }
}
