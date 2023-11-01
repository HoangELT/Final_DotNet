using Final_DotNet.Data;
using Final_DotNet.Models;
using Final_DotNet.Repository;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;

namespace Final_DotNet.Service
{
    public class OrderService : IOrderRepository
    {
        private readonly StoreDbContext dbContext;
        public OrderService(StoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }
        public void addOrder(string status, double total, bool isReview, int userId, Cart cart)
        {
            dbContext.Orders.Add(new Order(status, total, isReview, userId));
            dbContext.SaveChanges();

            int orderId = dbContext.Orders.OrderByDescending(p => p.OrderId).First().OrderId;
            foreach (var item in cart.listItem)
            {
                OrderDetail orderDetail = new()
                {
                    OrderId = orderId,
                    ProductId = item.product.ProductId,
                    Quantity = item.Quantity,
                    Color = item.Color
                };
                dbContext.OrderDetails.Add(orderDetail);
            }
            dbContext.SaveChanges();
        }

        public List<Order> getAllOrder() => dbContext.Orders.Include(u=>u.User).Include(o => o.Products).ToList();

        public List<Order> getOrderbyStatus(string status)
        {
            return dbContext.Orders.Include(u => u.User).Include(u => u.Products).Where(p => p.Status.Equals(status)).ToList();
        }

        public List<OrderDetail> getListOrderDetail(int orderId) => dbContext.OrderDetails.Include(u=>u.Order).ThenInclude(t=>t.User).Include(p=>p.Product).Where(p=>p.OrderId==orderId).ToList();

        public void removeOrder(int orderId)
        {
            var order = dbContext.Orders.FirstOrDefault(o => o.OrderId == orderId);
            if(order != null)
            {
                dbContext.Orders.Remove(order);
                dbContext.SaveChanges();
            }
        }

        public int TotalOrder()
        {
            return dbContext.Orders.Count();
        }

        public double TotalPrice()
        {
            var listorder = getAllOrder();
            double totalprice = 0;
            foreach(var item in listorder)
            {
                totalprice += item.Total;
            }
            return totalprice;
        }

        public void setOrderbyStatusId(int id, string status)
        {
            var order = dbContext.Orders.Find(id);
            if(order != null )
            {
                order.Status = status;
                dbContext.Update(order);
                dbContext.SaveChanges();
            }
        }

        public List<Order> getListOrderbyUserId(int userId)
        {
            var listOrder = dbContext.Orders.Include(p=>p.User).Include(p=>p.Products).ThenInclude(p=>p.Product).Where(p=>p.UserId==userId).ToList();
            return listOrder;
        }
    }
}
