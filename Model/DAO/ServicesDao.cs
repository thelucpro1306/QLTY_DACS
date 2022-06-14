using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class ServicesDao
    {
        OnlineShopDBContext db = null;
        public ServicesDao()
        {
            db = new OnlineShopDBContext();
        }

        public Service GetServicessById(long? id)
        {
            var service = db.Services.Where(d => d.id == id).FirstOrDefault();
            return service;
        }

        public bool LeaveComment(Feedback feedback)
        {
            db.Feedbacks.Add(feedback);
            
            return db.SaveChanges() > 0;
        }

    }
    
}
