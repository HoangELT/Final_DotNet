using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;

namespace Final_DotNet.Models
{
    public class Role
    {
        public int Id { get; set; }
        [Required]
        [MaxLength(50)]
        public string Name { get; set; } = string.Empty;
        public ICollection<UserRole> Users { get; set; } = new HashSet<UserRole>();
    }
}
