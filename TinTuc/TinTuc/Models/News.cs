//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TinTuc.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class News
    {
        public int news_id { get; set; }
        public int category_id { get; set; }
        public string news_title { get; set; }
        public string news_image { get; set; }
        public string news_content { get; set; }
    
        public virtual Category Category { get; set; }
    }
}
