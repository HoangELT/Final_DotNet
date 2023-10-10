using Microsoft.AspNetCore.Mvc;

namespace Final_DotNet.Controllers
{
    public class CartController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
