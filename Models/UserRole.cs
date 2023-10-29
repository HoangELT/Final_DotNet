using System.ComponentModel.DataAnnotations.Schema;

namespace Final_DotNet.Models
{
    public class UserRole
    {
        public UserRole(int userId, int roleId)
        {
            UserId = userId;
            RoleId = roleId;
        }

        [ForeignKey("UserId")]
        public int UserId { get; set; }

        [ForeignKey("RoleId")]
        public int RoleId { get; set; }
    }
}
