using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShopOnline.Areas.Admin.Data
{
    
    public class LoginModel
    {
        
        [Required(ErrorMessage = "Moi nhap Username!")]
        public string Username { get; set; }
        [Required(ErrorMessage = "Moi nhap Password")]
        public string Password { get; set; }
    }
}