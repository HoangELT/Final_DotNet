using System.Xml.Schema;

namespace Final_DotNet.ViewModels.Page
{
    public class PaginInfo
    {
        public int TotalItem { get; set; }
        public int ItemPerPage { get; set; }
        public int CurrentPage { get; set; }
        public int TotalPage => (int)Math.Ceiling((decimal)TotalItem / ItemPerPage);
    }
}
