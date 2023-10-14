using Final_DotNet.Models;
using Microsoft.AspNetCore.Mvc;

namespace Final_DotNet.Controllers
{
    public class RegisterController : Controller
    {
        private readonly StoreDbContext db;
        public RegisterController(StoreDbContext dbcontext) {
            db = dbcontext;
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Index(IFormCollection form)
        {
            string? fullname = form["fullname"];
            string? username = form["username"];
            string? password = form["password"];
            string? address = form["address"];
            string? email = form["email"];
            string? phone = form["phone"];
            int isUser = db.Users.Count(u => u.Email.Equals(email) || u.UserName.Equals(username) || u.PhoneNumber.Equals(phone));
            if(isUser == 0)
            {
                User user = new User();
                user.FullName = fullname;
                user.UserName = username;
                user.Password = password;
                user.Address = address;
                user.Email = email;
                user.PhoneNumber = phone;
                db.Users.Add(user);
                db.SaveChanges();
                TempData["Register"] = true;
                return RedirectToAction("Index", "Login");
            }
            else
            {
                return View();
            }
        }
    }
}
