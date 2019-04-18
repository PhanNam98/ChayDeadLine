using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace News_Web.Models
{
    public class New
    {
        [Key]
        
        public int Id { get; set; }

        [Column(TypeName ="nvarchar(100)")]
        [Required]
        public string Title { get; set; }
        
        public int Id_Category { get; set; }

        [Column(TypeName = "nvarchar(max)")]
        public string UrlImage { get; set; }

        [Column(TypeName = "nvarchar(max)")]
        [Required]
        public string Content { get; set; }
    }
}
