using Final_DotNet.Models;

namespace Final_DotNet.Repository
{
    public interface IColorRepository
    {
        public List<Color> getAllColor();
        public bool updateColor(Color color);
        public bool addColor(string name);
        public bool deleteColor(int id);
        public Color getColorbyId(int id);
    }
}
