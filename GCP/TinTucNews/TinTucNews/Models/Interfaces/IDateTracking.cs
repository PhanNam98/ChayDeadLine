using System;
namespace TinTucNews.Models.Interfaces
{
    public interface IDateTracking
    {
        DateTime? CreatedDate { set; get; }

        DateTime? UpdatedDate { set; get; }
    }
}
