using Final_DotNet.Models;

namespace Final_DotNet.Repository
{
    public interface IColorRepository
    {
        public List<Color> getAllColor();
        public void updateColor(Color color);
        public void addColor(string name);
        public void deleteColor(int id);
    }
}
