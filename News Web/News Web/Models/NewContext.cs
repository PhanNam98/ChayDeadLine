using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace News_Web.Models
{
    public class NewContext : DbContext
    {
        public NewContext(DbContextOptions<NewContext> options) : base(options)
        {

        }
        public DbSet<New> News
        {

            get; set;
        }


    }
}
