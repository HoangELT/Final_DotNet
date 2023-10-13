using Microsoft.AspNetCore.Mvc;

namespace Final_DotNet.Controllers
{
    public class LoginController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Index(IFormCollection form)
        {
            string username = form["username"];
            string password = form["password"];
            
            return View();
        }
    }
}
