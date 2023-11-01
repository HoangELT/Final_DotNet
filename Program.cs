using Final_DotNet.Repository;
using Final_DotNet.Service;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.EntityFrameworkCore;
using Final_DotNet.Data;
using Microsoft.AspNetCore.Hosting;

namespace Final_DotNet
{
    public class Program
	{
		public static void Main(string[] args)
		{
			var builder = WebApplication.CreateBuilder(args);

			// Add services to the container.
			builder.Services.AddControllersWithViews();
			builder.Services.AddScoped<IUserRepository, UserService>();
            builder.Services.AddScoped<IProductRepository, ProductService>();
            builder.Services.AddScoped<IProductColorRepository, ProductColorService>();
            builder.Services.AddScoped<ICategoryRepository, CategoryService>();
            builder.Services.AddScoped<IBrandRepository, BrandService>();
            builder.Services.AddScoped<IColorRepository, ColorService>();
            builder.Services.AddScoped<IRoleRepository, RoleService>();
            builder.Services.AddScoped<IOrderRepository, OrderService>();
            builder.Services.AddDistributedMemoryCache();
            builder.Services.AddSession(options =>
            {
                options.IdleTimeout = TimeSpan.FromMinutes(100); // Set the desired session timeout.
                options.Cookie.HttpOnly = true; // Ensure the session cookie is HTTP only.
            });

            builder.Services.AddDbContext<StoreDbContext>(options =>
            {
                options.UseSqlServer(builder.Configuration.GetConnectionString("StoreDbContext"));
            });

            var app = builder.Build();

			// Configure the HTTP request pipeline.
			if (!app.Environment.IsDevelopment())
			{
				app.UseExceptionHandler("/Home/Error");
				// The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
				app.UseHsts();
			}

			app.UseHttpsRedirection();
			app.UseStaticFiles();
            app.UseSession();
            app.UseRouting();

			app.UseAuthorization();

            app.MapControllerRoute(
				name: "default",
				pattern: "{controller=Home}/{action=Index}/{id?}");

            app.Run();
		}
	}
}