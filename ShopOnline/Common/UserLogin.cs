using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopOnline.Common
{
    [Serializable]
    public class UserLogin
    {       
        public long ID { get; set; }
        public string UserName { get; set; }
        public string GroupID { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }   

        public string Phone { get; set; }
    }
}