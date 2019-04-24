using TinTucNews.Models.Interfaces;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TinTucNews.Models
{
    [Table("Accounts")]
    public class Account : IDateTracking
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string Username { get; set; }

        [Required]
        [StringLength(250)]
        public string Password { get; set; }

        [Column(TypeName = "datetime2(7)")]
        [Display(Name = "Created Date")]
        public DateTime? CreatedDate { get ; set; }

        [Column(TypeName = "datetime2(7)")]
        [Display(Name = "Updated Date")]
        public DateTime? UpdatedDate { get; set; }
    }
}
