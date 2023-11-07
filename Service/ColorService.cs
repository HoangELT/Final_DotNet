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

        public bool updateColor(Color color)
        {
            var updatecolor = dbContext.Colors.Find(color.ColorId);
            if (updatecolor != null)
            {
                updatecolor.Name = color.Name;
                dbContext.Colors.Update(updatecolor);
                dbContext.SaveChanges();
                return true;
            }
            return false;
        }

        public bool addColor(string name)
        {
            var color = dbContext.Colors.FirstOrDefault(p => p.Name == name);
            if (color == null)
            {
                dbContext.Colors.Add(new Color(name));
                dbContext.SaveChanges();
                return true;
            }
            return false;
        }

        public bool deleteColor(int id)
        {

            var color = dbContext.Colors.Find(id);
            if (color != null)
            {
                dbContext.Colors.Remove(color);
                dbContext.SaveChanges();
                return true;
            }
            return false;
        }

        public Color? getColorbyId(int id)
        {
            var color = dbContext.Colors.Find(id);
            if(color != null)
            {
                return color;
            }
            return null;
        }
    }
}
