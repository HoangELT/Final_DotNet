using Final_DotNet.Data;
using Final_DotNet.Infrastructure;
using Final_DotNet.Models;
using Final_DotNet.Repository;
using Final_DotNet.ViewModels.Page;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Linq;

namespace Final_DotNet.Controllers
{
    public class ProductController : Controller
    {
        private readonly IProductRepository productRepository;
        private readonly IProductColorRepository productcolorRepository;
        private readonly IBrandRepository brandRepository;
        private readonly ICategoryRepository categoryRepository;
        private readonly IColorRepository colorRepository;
        private readonly IOrderRepository orderRepository;
        private readonly IReviewRepository revewRepository;
        private readonly StoreDbContext db;
        private int PageSize = 9;
        public ProductController(IOrderRepository orderRepository,StoreDbContext db, IReviewRepository revewRepository, ICategoryRepository categoryRepository,IColorRepository colorRepository,IBrandRepository brandRepository,IProductRepository productRepository, IProductColorRepository productcolorRepository)
        {
            this.productRepository = productRepository;
            this.productcolorRepository = productcolorRepository;
            this.brandRepository = brandRepository;
            this.colorRepository = colorRepository;
            this.categoryRepository = categoryRepository;
            this.revewRepository = revewRepository;
            this.orderRepository= orderRepository;
            this.db = db;
        }
        public void listProductActionBottom()
        {
            var Listproduct = productRepository.GetAllProduct();
            ViewBag.listAllproduct = Listproduct;
            List<Color> colorOfproduct = new List<Color>();
            var listpro = productRepository.GetAllProduct();
            foreach (var product in listpro)
            {
                colorOfproduct.Add(productcolorRepository.GetProductColor(product.ProductId).FirstOrDefault());
            }
            ViewBag.colorOfProduct = colorOfproduct;
        }
        // trả về product detail
        public ActionResult ProductDetail(int productId)
        {
            listProductActionBottom();
            ViewBag.listcolor = productcolorRepository.GetProductColor(productId);
            var allreview = revewRepository.getAllReviewbyproductId(productId);
            var totalreview = revewRepository.totalReview(productId);
            var totalproductrating = revewRepository.totalProductRating(productId);
            if (allreview != null && totalreview > 0 && totalproductrating > 0)
            {
                ViewBag.AllReviews = allreview;
                ViewBag.totalReviewRating = totalreview;
                ViewBag.totalProductRating = totalproductrating;
                return View(productRepository.GetProductById(productId));
            }
            else
            {
                ViewBag.AllReviews = null;
                ViewBag.totalReviewRating = 0;
                ViewBag.totalProductRating = 0;
                return View(productRepository.GetProductById(productId));
            }
        }
        public void Contain()
        {
            List<Color> colorOfproduct = new List<Color>();
            var listpro = productRepository.GetAllProduct();
            foreach (var product in listpro)
            {
                colorOfproduct.Add(productcolorRepository.GetProductColor(product.ProductId).FirstOrDefault());
            }
            ViewBag.colorProducts = colorOfproduct;

            ViewBag.ListColor = colorRepository.getAllColor();
            ViewBag.ListBand = brandRepository.GetListBrand();
        }
        public IActionResult AllProduct(int page = 1)
        {
            Contain();
            return View(
                    new ProductListView
                    {
                        Products = db.Products.Skip((page - 1) * PageSize).Take(PageSize),
                        PaginInfo = new PaginInfo
                        {
                            ItemPerPage = PageSize,
                            TotalItem = db.Products.Count(),
                            CurrentPage = page
                        }
                    }
                );
        }
        
        public IActionResult FilterCategory(int CategoryId, int page = 1)
        {
            Contain();
            return View("AllProduct",
                    new ProductListView
                    {
                        Products = db.Products
                        .Where(p => p.CategoryId== CategoryId)
                        .Skip((page - 1) * PageSize)
                        .Take(PageSize),
                        PaginInfo = new PaginInfo
                        {
                            ItemPerPage = PageSize,
                            TotalItem = db.Products.Count(),
                            CurrentPage = page
                        }
                    }
                );
        }
        [HttpPost]
        public IActionResult Search(string keywords, int page = 1)
        {
            Contain();
            return View("AllProduct",
                    new ProductListView
                    {
                        Products = db.Products
                        .Where(p => p.Name.Contains(keywords))
                        .Skip((page - 1) * PageSize)
                        .Take(PageSize),
                        PaginInfo = new PaginInfo
                        {
                            ItemPerPage = PageSize,
                            TotalItem = db.Products.Count(),
                            CurrentPage = page
                        }
                    }
                );
        }
        [HttpPost]
        public IActionResult GetFillterProducts([FromBody] FilterData filter)
        {
            var filterlistproducts = productRepository.GetAllProduct();
            if(filter.PriceRange!= null && filter.PriceRange.Count > 0 && !filter.PriceRange.Contains("all")){
                List<PriceRange> ListPriceRange = new List<PriceRange>();
                foreach (var range in filter.PriceRange)
                {
                    var value = range.Split("-").ToArray();
                    PriceRange priceRange = new PriceRange();
                    priceRange.Min = Int32.Parse(value[0]);
                    priceRange.Max = Int32.Parse(value[1]);
                    ListPriceRange.Add(priceRange);
                }
                filterlistproducts = filterlistproducts.Where(p => ListPriceRange.Any(range => p.CurPrice >= range.Min && p.CurPrice <= range.Max)).ToList();
            }
            if (filter.Colors != null && filter.Colors.Count > 0 && !filter.Colors.Contains("all")){
                foreach (var range in filter.Colors)
                {
                    var listpro = productcolorRepository.FilterColorProduct(Int32.Parse(range));
                    filterlistproducts = listpro;
                }
            }
            if (filter.Brands != null && filter.Brands.Count > 0 && !filter.Brands.Contains("all"))
            {
                var listproductcolor = productcolorRepository.GetAllProductColor();
                foreach (var i in listproductcolor)
                {
                    filterlistproducts = filterlistproducts.Where(p => filter.Brands.Contains(p.Brand.Name)).ToList();
                }
            }
            return PartialView("ResultFilter",filterlistproducts);
        }
        public IActionResult Review(int productid, int orderdetailId)
        {
            var product = productRepository.GetProductById(productid);
            var totalreview = revewRepository.totalReview(productid);
            var totalproductrating = revewRepository.totalProductRating(productid);
            if (product != null && totalreview > 0 && totalproductrating > 0)
            {
                ViewBag.totalReviewRating22 = totalreview;
                ViewBag.totalProductRating22 = totalproductrating;
                ViewBag.OrderdetailId = orderdetailId;
                return View(product);
            }
            else if(product != null)
            {
                ViewBag.totalReviewRating22 = 0;
                ViewBag.totalProductRating22 = 0;
                ViewBag.OrderdetailId = orderdetailId;
                return View(product);
            }
            else
            {
                return NotFound("Not found Product");
            }
        }
        
        [HttpPost]
        public IActionResult Review(IFormCollection form)
        {
            var user = HttpContext.Session.GetJson<User>("UserLogin");
            revewRepository.addReview(user.UserId, int.Parse(form["productId"]), int.Parse(form["rating"]), form["comment"]);
            orderRepository.updateOrderDetail(int.Parse(form["orderdetailId"]));
            return RedirectToAction("OrderResult", "Cart");
        }
        public IActionResult EditReview(int productid)
        {
            var user = HttpContext.Session.GetJson<User>("UserLogin");
            var product = productRepository.GetProductById(productid);
            var review = revewRepository.getReview(productid, user.UserId);
            ViewBag.ReviewProduct = review;
            ViewBag.totalProductRating33 = revewRepository.totalProductRating(productid);
            ViewBag.totalReviewRating33 = revewRepository.totalReview(productid);
            return View(product);
        }
        [HttpPost]
        public IActionResult EditReview(IFormCollection form)
        {
            var newreview = new Review();
            newreview.ReviewId = int.Parse(form["reviewId"]);
            newreview.Comment = form["comment"];
            newreview.Rating = int.Parse(form["rating"]);
            revewRepository.updateReview(newreview);
            return RedirectToAction("OrderResult", "Cart");
        }
    }
}
