using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Final_DotNet.Models
{
    public class UserRole
    {
        [Key]
        public int UserRoleId { get; set; }

        [ForeignKey("UserId")]
        public int UserId { get; set; }

        [ForeignKey("RoleId")]
        public int RoleId { get; set; }

        public UserRole(int userId, int roleId)
        {
            UserId = userId;
            RoleId = roleId;
        }

    }
}
