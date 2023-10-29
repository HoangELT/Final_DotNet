using Final_DotNet.Models;
using Final_DotNet.Repository;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.EntityFrameworkCore.Storage;
using System.Diagnostics;

namespace Final_DotNet.Controllers
{
	public class HomeController : Controller
	{		
		private readonly IProductRepository productRepository;
        private readonly IProductColorRepository productcolorRepository;
        public HomeController(IProductRepository productRepo, IProductColorRepository productcolorRepository)
		{
			productRepository = productRepo;
			this.productcolorRepository = productcolorRepository;
        }
		public ActionResult Index()
		{
			List<Color> colorOfproduct = new List<Color>();
            var listpro = productRepository.GetAllProduct();
			foreach (var product in listpro)
			{
                colorOfproduct.Add(productcolorRepository.GetProductColor(product.ProductId).FirstOrDefault());
            }
			ViewBag.Listcolor = colorOfproduct;
            return View(listpro);
		}

		public IActionResult Privacy()
		{
			return View();
		}

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error()
		{
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}
	}
}