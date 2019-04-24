using Microsoft.EntityFrameworkCore;

namespace TinTucNews.Models
{
    public class NewContext : DbContext
    {
        public NewContext(DbContextOptions<NewContext> options) : base(options)
        { }
        public DbSet<New> News { get; set; }
        public DbSet<Account> Accounts { get; set; }



    }
}
