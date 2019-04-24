using TinTucNews.Models.Interfaces;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TinTucNews.Models
{
    [Table("News")]
    public class New : IDateTracking
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

        [Column(TypeName = "datetime2(7)")]
        public DateTime? CreatedDate { get; set; }

        [Column(TypeName = "datetime2(7)")]
        public DateTime? UpdatedDate { get; set; }
    }
}
