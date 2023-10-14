
using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;

namespace Final_DotNet.Models
{
    public class User
    {
        public int Id { get; set; }
        [NotNull]
        [MaxLength(50)]
        public string FullName { get; set; }
        [NotNull]
        [MaxLength(50)]
        public string UserName { get; set; }
        [NotNull]
        [MaxLength(50)]
        public string Password { get; set; }
        [NotNull]
        [MaxLength(50)]
        public string Email { get; set; }
        [NotNull]
        [MaxLength(50)]
        public string Address { get; set; }
        [NotNull]
        [MaxLength(50)]
        public string PhoneNumber { get; set; }

        public List<Blog> Blogs { get; set;}
        public Role Role { get; set; }
        public List<Order> Orders {  get; set; }
    }
}
