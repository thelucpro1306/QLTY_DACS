using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ShopOnline.Models
{
    public class RegisterModel
    {
        [Key]
        public long ID { get; set; }
        [Display(Name ="Ten dang nhap")]
        [Required(ErrorMessage = "Required")]
        public string Username { get; set; }
        [Display(Name = "Mat khau")]
        [StringLength(20,MinimumLength = 6,ErrorMessage ="Do dai password it nhat 6 ky tu")]
        [Required(ErrorMessage = "Required")]
        public string Password { get; set; }
        [Display(Name = "Xac nhan mat khau")]
        [Required(ErrorMessage = "Required")]
        [Compare("Password",ErrorMessage = "Xac nhan mat khau khong dung")]
        public string ConfirmPassword { get; set; }
        [Display(Name = "Ho ten")]
        [Required(ErrorMessage = "Required")]
        public string name { get; set; }
        [Display(Name = "Email")]
        [Required(ErrorMessage = "Required")]
        public string Email { get; set; }
        [Display(Name = "Phone")]
        [Required(ErrorMessage = "Required")]
        public string Phone { get; set; }


    }
}