using Microsoft.AspNetCore.Identity;

namespace Final_DotNet.Models
{
    public class User
    {
        public int Id { get; set; }
        public string? FullName { get; set; }
        public string? UserName { get; set; }
        public string? Password { get; set; }
        public string? Email { get; set; }
        public string? Address { get; set; }
        public string? PhoneNumber { get; set; }

        public List<Blog> Blogs { get; set;}
        public Role Role { get; set; }
        public List<Order> Orders {  get; set; }
    }
}
