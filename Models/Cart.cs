using System.Runtime.InteropServices;

namespace Final_DotNet.Models
{
    public class Cart
    {
        public List<CartItem> listItem { get; set; } = new List<CartItem>();

        public void addItem(Product product, int quantity, string Color)
        {
            CartItem? cartItem = listItem.Where(p => p.product.ProductId == product.ProductId && p.Color.Equals(Color)).FirstOrDefault();
            if(cartItem == null)
            {
                listItem.Add(new CartItem
                {
                    product = product,
                    Quantity = quantity,
                    Color = Color
                });
            }
            else
            {
                cartItem.Quantity += quantity;
            }
        }
        public void removeItem(Product product, string color)=> listItem.RemoveAll(p => p.product.ProductId == product.ProductId & p.Color.Equals(color));

        public double calTotalPrice() => listItem.Sum(p => p.product.CurPrice * p.Quantity);
        public int TotalProduct() => listItem.Count();

        public void Clear() => listItem.Clear();

        public class CartItem
        {
            public Product product { get; set; } = new();
            public int Quantity { get; set; }
            public string Color { get; set; } = string.Empty;
        }
    }
}
