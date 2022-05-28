using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopOnline.Models
{
    public class ServicesModel
    {
        public long id { get; set; }

        public string name { get; set; }

        public int? Cost { get; set; }

        
        public string Description { get; set; }


    }
}