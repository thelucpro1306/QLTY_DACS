using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class MenuDao
    {
        OnlineShopDBContext db = null;
        public MenuDao()
        {
            db = new OnlineShopDBContext();
        }

        public List<Menu> ListByGroupID(int group)
        {
            return db.Menus.Where(x=>x.TypeID == group).ToList();
        }

    }
}
