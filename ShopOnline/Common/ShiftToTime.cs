using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopOnline.Common
{
    public static class ShiftToTime
    {
        public static string shiftToTime(long? ca)
        {
            switch (ca)
            {
                case 1:
                    return "7h30";                    
                    case 2:
                    return "9h30";
                    case 3:
                    return "13h30";
                case 4:
                    return "15h30";
                default:
                    return "Lỗi";
                    
            }
            
        }
    }
}