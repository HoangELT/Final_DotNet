using Final_DotNet.Infrastructure;
using Final_DotNet.Models;
using Final_DotNet.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace Final_DotNet.Controllers
{
    public class CartController : Controller
    {
        private readonly IProductRepository productRepository;
        private readonly ILogger<CartController> logger;
        public CartController(IProductRepository productRepository, ILogger<CartController> logger)
        {
            this.productRepository = productRepository;
            this.logger= logger;
        }
        public IActionResult Index()
        {
            cart = HttpContext.Session.GetJson<Cart>("cart");
            return View("Cart", cart);
        }

        public Cart cart { get; set; }
        public IActionResult addToCart(int productid, int quantity, string color)
        {
            var product = productRepository.GetProductById(productid);
            if (product != null)
            {
                cart = HttpContext.Session.GetJson<Cart>("cart") ?? new Cart();
                cart.addItem(product, quantity, color);
                HttpContext.Session.SetJson("cart", cart);
            }
            return View("Cart",cart);
        }
        public IActionResult updateCart(int productid, string color)
        {
            var product = productRepository.GetProductById(productid);
            if (product != null)
            {
                cart = HttpContext.Session.GetJson<Cart>("cart") ?? new Cart();
                cart.addItem(product, -1, color);
                HttpContext.Session.SetJson("cart", cart);
            }
            return View("Cart", cart);
        }
        public IActionResult removeFromCart(int productid, string color)
        {
            var product = productRepository.GetProductById(productid);
            if (product != null)
            {
                cart = HttpContext.Session.GetJson<Cart>("cart");
                cart.removeItem(product, color);
                HttpContext.Session.SetJson("cart", cart);
            }
            return View("Cart", cart);
        }
    }
}
