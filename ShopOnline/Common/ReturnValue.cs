using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopOnline.Common
{
    public class ReturnValue
    {
        public ReturnValue()
        {

        }

        public static string returnTrueOrFalse(bool status)
        {
            return status is true ? "Có" : "Không";
        }

        public static string StringToDecimal(double status)
        {
            return String.Format("{0:#,###,###.##}", status);
        }

    }
}