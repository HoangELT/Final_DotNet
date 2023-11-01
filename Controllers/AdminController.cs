using Final_DotNet.Models;
using Final_DotNet.Repository;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.SqlServer.Server;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.Processing;

namespace Final_DotNet.Controllers
{
    public class AdminController : Controller
    {
        private readonly IUserRepository userRepository;
        private readonly ICategoryRepository categoryRepository;
        private readonly IProductRepository productRepository;
        private readonly IProductColorRepository productColorRepository;
        private readonly IBrandRepository brandRepository;
        private readonly IColorRepository colorRepository;
        private readonly IOrderRepository orderRepository;
        private readonly IWebHostEnvironment webHostEnvironment;
        private readonly ILogger<AdminController> logger;
        public AdminController(IWebHostEnvironment webHostEnvironment,ILogger<AdminController> logger, IOrderRepository orderRepository, IProductColorRepository productColorRepository, IUserRepository userRepository, ICategoryRepository categoryRepository, IProductRepository productRepository, IColorRepository colorRepository, IBrandRepository brandRepository)
        {
            this.userRepository = userRepository;
            this.categoryRepository = categoryRepository;
            this.productRepository = productRepository;
            this.colorRepository = colorRepository;
            this.productColorRepository = productColorRepository;
            this.logger = logger;
            this.brandRepository = brandRepository;
            this.webHostEnvironment= webHostEnvironment;
            this.orderRepository = orderRepository;
        }
        public IActionResult Index()
        {
            ViewBag.TotalUser = userRepository.totalUser();
            ViewBag.TotalProduct = productRepository.toTalProduct();
            ViewBag.TotalOrder = orderRepository.TotalOrder();
            ViewBag.TotalPrice = orderRepository.TotalPrice();
            return View();
        }
        // --------------User---------------------
        public IActionResult AllUser()
        {
            return View(userRepository.GetAllUser());
        }
        // --------------Product---------------------
        public IActionResult AllProducts()
        {
            return View(productRepository.GetAllProduct());
        }
        [HttpPost]
        public IActionResult AddProduct(IFormCollection form, IFormFile image)
        {
            string fileName = image.FileName;
            var uploadsPath = Path.Combine(webHostEnvironment.WebRootPath, "templates", "img", "imgProduct");
            var filePath = Path.Combine(uploadsPath, fileName);

            using (var imageStream = image.OpenReadStream())
            {
                // Load ảnh gốc
                using (var originalImage = Image.Load(imageStream))
                {
                    // Chỉnh kích thước
                    originalImage.Mutate(x => x
                        .Resize(new ResizeOptions
                        {
                            Size = new Size(500, 500),
                            Mode = ResizeMode.Max
                        }));

                    // Lưu ảnh đã chỉnh sửa
                    originalImage.Save(filePath); // Lưu ảnh đã chỉnh sửa vào đường dẫn filePath
                }

                // Thêm sản phẩm vào cơ sở dữ liệu
                productRepository.addProduct(form["name"], form["description"], form["small_description"], Double.Parse(form["selling_price"]), Double.Parse(form["original_price"]), image.FileName, Int32.Parse(form["brand_id"]), Int32.Parse(form["category_id"]), form["colors"]);

                return RedirectToAction("AllProducts");
            }
        }


        public IActionResult AddProduct()
        {
            ViewBag.Colors = colorRepository.getAllColor();
            ViewBag.Categories = categoryRepository.getAllCategories();
            ViewBag.Brands = brandRepository.GetListBrand();
            return View();
        }
        public IActionResult EditProduct(int productId)
        {
            var listpro = productRepository.GetAllProduct();
            var listcolorOfproduct = productColorRepository.GetProductColor(productId);
            foreach (var product in listpro)
            {
                if (product.ProductId == productId)
                {
                    ViewBag.Categories = categoryRepository.getAllCategories();
                    ViewBag.ColorOfproduct = listcolorOfproduct;
                    ViewBag.ListColors = colorRepository.getAllColor();
                    ViewBag.Brands = brandRepository.GetListBrand();
                    return View(product);
                }
            }
            return NotFound();
        }
        [HttpPost]
        public ActionResult EditProduct(IFormCollection form, IFormFile image)
        {
            var proId = Int32.Parse(form["product_id"]);
            var newProduct = new Product();
            newProduct.ProductId = proId;
            newProduct.CategoryId = Int32.Parse(form["category_id"]);
            newProduct.Name = form["name"];
            newProduct.DisPrice = Double.Parse(form["original_price"]);
            newProduct.CurPrice = Double.Parse(form["selling_price"]);
            newProduct.Description = form["description"];
            newProduct.SmallDescription = form["small_description"];
            newProduct.BrandId = Int32.Parse(form["brand_id"]);
            logger.LogInformation("product " + newProduct.ProductId);
            if (image != null && image.Length > 0)
            {
                newProduct.ImageUrl = image.FileName;
                var uploadsPath = Path.Combine(webHostEnvironment.WebRootPath, "templates", "img", "imgProduct");
                var filePath = Path.Combine(uploadsPath, image.FileName);

                // Sao chép tệp hình ảnh vào thư mục đích
                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    image.CopyTo(stream);
                }
            }
            else { newProduct.ImageUrl = form["old_image"]; }
            productRepository.updateProduct(newProduct);
            productColorRepository.updateProductColor(proId, form["colors"]);
            return RedirectToAction("AllProducts");
        }
        [HttpPost]
        public ActionResult DeleteProduct(int productId)
        {
            productRepository.deleteProduct(productId);
            return RedirectToAction("AllProducts");
        }

        // --------------Category---------------------
        public IActionResult AllCategories()
        {
            return View(categoryRepository.getAllCategories());
        }
        [HttpPost]
        public ActionResult DeleteCategory(int categoryId)
        {
            categoryRepository.deleteCategory(categoryId);
            return RedirectToAction("AllCategories");
        }
        [HttpPost]
        public ActionResult AddCategory(IFormCollection form)
        {
            categoryRepository.addCategory(form["name"], form["description"]);
            return RedirectToAction("AllCategories");
        }
        public IActionResult AddCategory()
        {
            return View();
        }
        [HttpPost]
        public ActionResult EditCategory(IFormCollection form)
        {
            string? cateId = form["categoryId"];
            var newCategory = new Category();
            newCategory.CategoryId = Int32.Parse(cateId);
            newCategory.Name = form["name"];
            newCategory.Description = form["description"];
            categoryRepository.updateCategory(newCategory);
            return RedirectToAction("AllCategories");
        }
        public IActionResult EditCategory(int categoryId)
        {
            var cate = categoryRepository.getAllCategories();
            foreach (var c in cate)
            {
                if (c.CategoryId == categoryId)
                {
                    return View(c);
                }
            }
            return NotFound();
        }

        // --------------Order---------------------
        [Route("Admin/AllOrders")]
        public IActionResult AllOrders(string status)
        {
            if (status != null)
            {
                return View(orderRepository.getOrderbyStatus(status));
            }
            return View(orderRepository.getAllOrder());
        }

        public IActionResult GetListOrderDetail(int orderId)
        {
            return View(orderRepository.getListOrderDetail(orderId));
        }
        public IActionResult SetOrderStatus(int orderId, string status)
        {
            orderRepository.setOrderbyStatusId(orderId, status);
            return RedirectToAction("GetListOrderDetail", new { orderId = orderId });
        }
        // --------------Blog---------------------
        public IActionResult AllBlogs()
        {
            return View();
        }

        public IActionResult AddBlog()
        {
            return View();
        }
        [HttpPost]
        public IActionResult AddBlog(IFormCollection form)
        {
            return View();
        }

        // --------------Brand---------------------
        public IActionResult AllBrands()
        {
            return View(brandRepository.GetListBrand());
        }

        public IActionResult AddBrand()
        {
            return View();
        }
        [HttpPost]
        public IActionResult AddBrand(IFormCollection form)
        {
            brandRepository.addBrand(form["brand_name"]);
            return RedirectToAction("AllBrands");
        }
        [HttpPost]
        public IActionResult EditBrand(IFormCollection form)
        {
            var brand = new Brand();
            brand.BrandId = Int32.Parse(form["brandId"]);
            brand.Name = form["brand_name"];
            brandRepository.updateBrand(brand);
            return RedirectToAction("AllBrands");
        }
        public IActionResult EditBrand(int brandId)
        {
            return View(brandRepository.GetBrandById(brandId));
        }
        public IActionResult DeleteBrand(int brandId)
        {
            brandRepository.deleteBrand(brandId);
            return RedirectToAction("AllBrands");
        }
        // --------------Brand---------------------
        public IActionResult AllColors()
        {
            return View(colorRepository.getAllColor());
        }

        public IActionResult AddColor()
        {
            return View();
        }
        [HttpPost]
        public IActionResult AddColor(IFormCollection form)
        {
            colorRepository.addColor(form["color_name"]);
            return RedirectToAction("AllColors");
        }
        [HttpPost]
        public IActionResult EditColor(IFormCollection form)
        {
            var color = new Models.Color();
            color.ColorId = Int32.Parse(form["colorId"]);
            color.Name = form["color_name"];
            colorRepository.updateColor(color);
            return RedirectToAction("AllColors");
        }
        public IActionResult EditColor(int brandId)
        {
            return View(brandRepository.GetBrandById(brandId));
        }
        public IActionResult DeleteColor(int colorId)
        {
            colorRepository.deleteColor(colorId);
            return RedirectToAction("AllColors");
        }
    }
}
