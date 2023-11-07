using Microsoft.EntityFrameworkCore;
using System.Data;
using Final_DotNet.Models;
using Microsoft.AspNetCore.Identity;

namespace Final_DotNet.Data
{
    public class StoreDbContext : DbContext
    {
        public DbSet<User> Users { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Review> Reviews { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderDetail> OrderDetails { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<UserRole> UserRoles { get; set; }
        public DbSet<Color> Colors { get; set; }
        public DbSet<Brand> Brands { get; set; }
        public DbSet<ProductColor> ProductColors { get; set; }
        public StoreDbContext(DbContextOptions<StoreDbContext> options) : base(options)
        {

        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<UserRole>().HasKey(r => new { r.RoleId, r.UserId });

            //modelBuilder.Entity<OrderDetail>().HasOne(x => x.Product)
            //                                  .WithMany(x => x.Orders)
            //                                  .HasForeignKey(x => x.ProductId);
            //modelBuilder.Entity<OrderDetail>().HasOne(x => x.Order)
            //                                  .WithMany(x => x.Products)
            //                                  .HasForeignKey(x => x.OrderId);

            //modelBuilder.Entity<Product>().HasOne(x => x.Category)
            //                              .WithMany(x => x.Products)
            //                              .HasForeignKey(p => p.CategoryId)
            //                              .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
