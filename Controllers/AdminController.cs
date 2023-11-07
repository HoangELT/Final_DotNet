using Final_DotNet.Infrastructure;
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
        private readonly IUserRoleRepository userroleRepo;
        private readonly IBrandRepository brandRepository;
        private readonly IColorRepository colorRepository;
        private readonly IOrderRepository orderRepository;
        private readonly IWebHostEnvironment webHostEnvironment;
        private readonly ILogger<AdminController> logger;
        public AdminController(IUserRoleRepository userroleRepo,IWebHostEnvironment webHostEnvironment,ILogger<AdminController> logger, IOrderRepository orderRepository, IProductColorRepository productColorRepository, IUserRepository userRepository, ICategoryRepository categoryRepository, IProductRepository productRepository, IColorRepository colorRepository, IBrandRepository brandRepository)
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
            this.userroleRepo = userroleRepo;
        }
        public IActionResult Index()
        {
            var user = HttpContext.Session.GetJson<User>("UserLogin");
            if (user != null)
            {
                if (userroleRepo.AuthUserAdmin(user))
                {
                    ViewBag.TotalUser = userRepository.totalUser();
                    ViewBag.TotalProduct = productRepository.toTalProduct();
                    ViewBag.TotalOrder = orderRepository.TotalOrder();
                    ViewBag.TotalPrice = orderRepository.TotalPrice();
                    return View();
                }
                else
                {
                    //TempData["NotAdmin"] = "You are not Admin";
                    return RedirectToAction("Index", "Home");
                }
            }
            TempData["NotLogin"] = "Please login to continue";
            return RedirectToAction("Login", "Account");
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
                using (var originalImage = Image.Load(imageStream))
                {
                    originalImage.Mutate(x => x
                        .Resize(new ResizeOptions
                        {
                            Size = new Size(500, 500),
                            Mode = ResizeMode.Max
                        }));

                    originalImage.Save(filePath);
                }
                var isproduct = productRepository.addProduct(form["name"], form["description"], form["small_description"], Double.Parse(form["selling_price"]), Double.Parse(form["original_price"]), image.FileName, Int32.Parse(form["brand_id"]), Int32.Parse(form["category_id"]), form["colors"]);
                if (isproduct)
                {
                    TempData["AddProductSuccess"] = "Added product successfully";
                    return RedirectToAction("AllProducts");
                }
                TempData["AddProductFailed"] = "Add product failed";
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

            if (image != null && image.Length > 0)
            {
                newProduct.ImageUrl = image.FileName;
                var uploadsPath = Path.Combine(webHostEnvironment.WebRootPath, "templates", "img", "imgProduct");
                var filePath = Path.Combine(uploadsPath, image.FileName);

                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    image.CopyTo(stream);
                }
            }
            else { newProduct.ImageUrl = form["old_image"]; }

            if (productRepository.updateProduct(newProduct))
            {
                productColorRepository.updateProductColor(proId, form["colors"]);
                TempData["UpdateProductSuccess"] = "Updated product successfully";
                return RedirectToAction("AllProducts");
            }
            TempData["UpdateProductFailed"] = "Update product failed";
            return RedirectToAction("AllProducts");
        }
        [HttpPost]
        public ActionResult DeleteProduct(int productId)
        {
            if (productRepository.deleteProduct(productId))
            {
                TempData["DeleteProductSuccess"] = "Deleted product successfully";
                return RedirectToAction("AllProducts");
            }
            TempData["DeleteProductFailed"] = "Delete product failed";
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
            if (categoryRepository.deleteCategory(categoryId))
            {
                TempData["DeleteCategorySuccess"] = "Deleted category successfully";
                return RedirectToAction("AllCategories");
            }
            TempData["DeleteCategoryFailed"] = "Delete category failed";
            return RedirectToAction("AllCategories");
        }
        [HttpPost]
        public ActionResult AddCategory(IFormCollection form)
        {
            if(categoryRepository.addCategory(form["name"], form["description"]))
            {
                TempData["AddCategorySuccess"] = "Added category successfully";
                return RedirectToAction("AllCategories");
            }
            TempData["AddCategoryFailed"] = "Add category failed";
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
            if(categoryRepository.updateCategory(newCategory)){
                TempData["UpdateCategorySuccess"] = "Updated category successfully";
                return RedirectToAction("AllCategories");
            }
            TempData["UpdateCategoryFailed"] = "Update category failed";
            return RedirectToAction("AllCategories");
        }
        public IActionResult EditCategory(int categoryId)
        {
            return View(categoryRepository.getCategorybyId(categoryId));
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
            TempData["UpdateStatusSuccess"] = "Updated status successfully";
            return RedirectToAction("GetListOrderDetail", new { orderId = orderId });
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
            if (brandRepository.addBrand(form["brand_name"]))
            {
                TempData["AddBrandSuccess"] = "Added brand successfully";
                return RedirectToAction("AllBrands");
            }
            TempData["AddBrandFailed"] = "Add brand failed";
            return RedirectToAction("AllBrands");
        }
        [HttpPost]
        public IActionResult EditBrand(IFormCollection form)
        {
            var brand = new Brand();
            brand.BrandId = Int32.Parse(form["brandId"]);
            brand.Name = form["brand_name"];
            if (brandRepository.updateBrand(brand))
            {
                TempData["EditBrandSuccess"] = "Updated brand successfully";
                return RedirectToAction("AllBrands");
            }
            TempData["EditBrandFailed"] = "Update brand failed";
            return RedirectToAction("AllBrands");
        }
        public IActionResult EditBrand(int brandId)
        {
            return View(brandRepository.GetBrandById(brandId));
        }
        public IActionResult DeleteBrand(int brandId)
        {
            if (brandRepository.deleteBrand(brandId))
            {
                TempData["DeleteBrandSuccess"] = "Deleted brand successfully";
                return RedirectToAction("AllBrands");
            }
            TempData["DeleteBrandFailed"] = "Delete brand failed";
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
            if (colorRepository.addColor(form["color_name"]))
            {
                TempData["AddColorSuccess"] = "Added color successfully";
                return RedirectToAction("AllColors");
            }
            TempData["AddColorFailed"] = "Add color failed";
            return RedirectToAction("AllColors");
        }
        [HttpPost]
        public IActionResult EditColor(IFormCollection form)
        {
            var color = new Models.Color();
            color.ColorId = Int32.Parse(form["colorId"]);
            color.Name = form["color_name"];
            if (colorRepository.updateColor(color))
            {
                TempData["UpdateColorSuccess"] = "Updated color successfully";
                return RedirectToAction("AllColors");
            }
            TempData["UpdateColorFailed"] = "Update color failed";
            return RedirectToAction("AllColors");
        }
        public IActionResult EditColor(int colorId)
        {
            return View(colorRepository.getColorbyId(colorId));
        }
        public IActionResult DeleteColor(int colorId)
        {
            if (colorRepository.deleteColor(colorId))
            {
                TempData["DeleteColorSuccess"] = "Deleted color successfully";
                return RedirectToAction("AllColors");
            }
            TempData["DeleteColorFailed"] = "Delete color failed";
            return RedirectToAction("AllColors");
        }
    }
}
