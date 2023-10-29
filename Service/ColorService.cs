using Final_DotNet.Data;
using Final_DotNet.Models;
using Final_DotNet.Repository;
using Microsoft.EntityFrameworkCore;

namespace Final_DotNet.Service
{
    public class ColorService : IColorRepository
    {
        private List<Color> colors = new List<Color>();
        private readonly StoreDbContext dbContext;
        public ColorService(StoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public List<Color> getAllColor()
        {
            colors = dbContext.Colors.ToList();
            return colors;
        }

        public void updateColor(Color color)
        {
            var updatecolor = dbContext.Colors.Find(color.ColorId);
            updatecolor.Name = color.Name;
            dbContext.Colors.Update(updatecolor);
            dbContext.SaveChanges();
        }

        public void addColor(string name)
        {
            var color = dbContext.Colors.FirstOrDefault(p => p.Name == name);
            if (color == null)
            {
                dbContext.Colors.Add(new Color(name));
                dbContext.SaveChanges();
            }
        }

        public void deleteColor(int id)
        {

            var color = dbContext.Colors.Find(id);
            if (color != null)
            {
                dbContext.Colors.Remove(color);
                dbContext.SaveChanges();
            }
        }
    }
}
