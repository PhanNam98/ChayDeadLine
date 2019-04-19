using System.Collections.Generic;

namespace TinTucNews.Models
{
    public class DetailNewS
    {
        public New DetailNew { get; set; }
        public List<New> FeaturedPosts { get; set; }
        public DetailNewS()
        {

        }
        public DetailNewS(New n, List<New> list)
        {
            this.DetailNew = n;
            this.FeaturedPosts = list;
        }
    }
}
