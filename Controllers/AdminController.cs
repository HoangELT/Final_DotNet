using Microsoft.AspNetCore.Mvc;

namespace Final_DotNet.Controllers
{
    public class AdminController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
