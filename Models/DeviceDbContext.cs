using Microsoft.EntityFrameworkCore;
using System.Data;
using Final_DotNet.Models;

namespace Final_DotNet.Models
{
	public class DeviceDbContext : DbContext
	{
		public DbSet<User> Users { get; set; }
        public DbSet<Blog> Blogs { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Review> Reviews { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderDetail> OrderDetails { get; set; }
        public DbSet<Category> Categories { get; set; }


        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Data Source=DELL-ELT\\MSSQL;Initial Catalog=FinalDotNet_db;Integrated Security=True;Connect Timeout=30;Encrypt=False;Trust Server Certificate=False;Application Intent=ReadWrite;Multi Subnet Failover=False");
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            //config Category
            modelBuilder.Entity<Category>(entity =>
            {
                entity.HasKey(e => e.Id).HasName("PK__tbl_cate__D54EE9B45F44D970");

                entity.ToTable("Category");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("Id");
                entity.Property(e => e.Description)
                    .HasMaxLength(1000)
                    .IsUnicode(false)
                    .HasColumnName("Description");
                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("Name");
                entity.HasMany(category => category.Products)
                      .WithOne(product => product.Category)
                      .HasForeignKey(product => product.Category.Id)
                      .OnDelete(DeleteBehavior.Cascade);
            });
            //config Product
            modelBuilder.Entity<Product>(entity =>
            {
                entity.HasKey(e => e.Id).HasName("PK__tbl_pro__D54EE9B45F44D970");

                entity.ToTable("Product");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("Id");
                entity.Property(e => e.Description)
                    .HasMaxLength(1000)
                    .IsUnicode(false)
                    .HasColumnName("Description");
                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("Name");
                entity.Property(e => e.Color)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("Color");
                entity.Property(e => e.Brand)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("Brand");
                entity.Property(e => e.Category)
                    .HasColumnName("Category");
                entity.Property(e => e.Price)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("Price");
                entity.Property(e => e.Price)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("Price");
                entity.HasOne(pro => pro.Category)
                      .WithMany(cate => cate.Products)
                      .HasForeignKey(product => product.Category.Id)
                      .OnDelete(DeleteBehavior.Cascade);
            });
            //config User
            modelBuilder.Entity<User>(entity =>
            {
                entity.HasKey(e => e.Id).HasName("PK__tbl_user__EAA7D14BDFE1B9E9");

                entity.ToTable("User");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("Id");
                entity.Property(e => e.Address)
                    .HasColumnType("text")
                    .HasColumnName("Address");
                entity.Property(e => e.Email)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("Email");
                entity.Property(e => e.Password)
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("Password");
                entity.Property(e => e.PhoneNumber)
                    .HasMaxLength(11)
                    .IsUnicode(false)
                    .HasColumnName("PhoneNumber");
                entity.Property(e => e.UserName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("Username");
                entity.Property(e => e.FullName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("FullName");

                entity.HasMany(user => user.Blogs)
                      .WithOne(blog => blog.User)
                      .HasForeignKey(blog => blog.User.Id)
                      .OnDelete(DeleteBehavior.Cascade);
                entity.HasOne(user => user.Role)
                      .WithOne(role => role.User)
                      .HasForeignKey<Role>(role => role.UserId)
                      .OnDelete(DeleteBehavior.Cascade);
                entity.HasMany(user => user.Orders)
                      .WithOne(order => order.User)
                      .HasForeignKey(order => order.User.Id)
                      .OnDelete(DeleteBehavior.Cascade);
            });
            //config Role
            modelBuilder.Entity<Role>()
                        .ToTable("Role")
                        .HasKey(role => role.Id);
            //config OrderDetail
            modelBuilder.Entity<OrderDetail>()
                        .HasMany(orderdetail => orderdetail.Products)
                        .WithMany(product => product.OrderDetails);
                        
        }

    }
}
