using Final_DotNet.Models;

namespace Final_DotNet.Repository
{
    public interface IOrderRepository
    {
        public void addOrder(string status, double total, int userId, Cart cart);
        public void updateOrderDetail(int orderdetailId);
        public List<Order> getAllOrder();
        public List<Order> getListOrderbyUserId(int userId);
        public List<OrderDetail> getListOrderDetail(int orderId);
        public List<Order> getOrderbyStatus(string status);
        public void setOrderbyStatusId(int id, string status);
        public int TotalOrder();
        public double TotalPrice();
    }
}
