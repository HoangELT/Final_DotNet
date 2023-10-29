﻿using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Final_DotNet.Models
{
    public class Order
    {
        [Key]
        public int OrderId { get; set; } = 0;

        [Required]
        [MaxLength(50)]
        public string? Status { get; set; }
        public double Total { get; set; }
        public bool isReview {  get; set; }
        public DateTime CreateAt { get; set; }
        //khóa ngoại tới user
        [ForeignKey("User")]
        public int UserId { get; set; }
        public User? User { get; set; }

        public ICollection<OrderDetail> Products { get; set; } = new HashSet<OrderDetail>();
    }
}
