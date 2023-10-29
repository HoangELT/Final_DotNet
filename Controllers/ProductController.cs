using Final_DotNet.Data;
using Final_DotNet.Models;
using Final_DotNet.Models.Page;
using Final_DotNet.Repository;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Diagnostics;
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
        private readonly StoreDbContext db;
        private int PageSize = 9;
        public ProductController(StoreDbContext db, ICategoryRepository categoryRepository,IColorRepository colorRepository,IBrandRepository brandRepository,IProductRepository productRepository, IProductColorRepository productcolorRepository)
        {
            this.productRepository = productRepository;
            this.productcolorRepository = productcolorRepository;
            this.brandRepository = brandRepository;
            this.colorRepository = colorRepository;
            this.categoryRepository = categoryRepository;
            this.db = db;
        }
        // trả về product detail
        public ActionResult ProductDetail(int productId)
        {
            var Listproduct = productRepository.GetAllProduct();
            ViewBag.listAllproduct = Listproduct;
            ViewBag.listcolor = productcolorRepository.GetProductColor(productId);
            foreach(var item in Listproduct)
            {
                if (item.ProductId == productId)
                {
                    ViewBag.brand = brandRepository.GetBrandById(item.BrandId);
                }
            }
            return View(productRepository.GetProductById(productId));
        }
        public void Contain()
        {
            List<Color> colorOfproduct = new List<Color>();
            var listpro = productRepository.GetAllProduct();
            foreach (var product in listpro)
            {
                colorOfproduct.Add(productcolorRepository.GetProductColor(product.ProductId).FirstOrDefault());
            }
            ViewBag.ListcolorProducts = colorOfproduct;

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
                //danh sách các product thỏa mãn các color được check
                foreach (var range in filter.Colors)
                {
                    var listpro = productcolorRepository.GetProductbyColorId(Int32.Parse(range));
                    filterlistproducts = listpro;
                }
                //filterlistproducts = listpro;
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
    }
}
