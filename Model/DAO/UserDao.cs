using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;
namespace Model.DAO
{
    public class UserDao
    {
        OnlineShopDBContext db = null;
        public UserDao()
        {
            db = new OnlineShopDBContext();
        }
        public IEnumerable<User> ListAllPaging(string searchString, int page, int pageSize)
        {
            IOrderedQueryable<User> query = db.Users;
            if (!string.IsNullOrEmpty(searchString))
            {
                query = query.Where(x => x.Name.Contains(searchString) || x.Phone.Contains(searchString))
                    .OrderBy(p => p.UserName);
            }
            return query.OrderBy(p => p.UserName).ToPagedList(page, pageSize);
        }
        public long Insert(User user)
        {
            db.Users.Add(user);
            db.SaveChanges();
            return user.ID;
        }
        public bool CheckUserName(string userName)
        {
            return db.Users.Count(x => x.UserName == userName) > 0;
        }
        public bool CheckEmail(string email)
        {
            return db.Users.Count(x => x.Email == email) > 0;
        }
        public User getByID(string username)
        {
            var a = db.Users.Where(x => x.UserName == username).FirstOrDefault();
            return a;
        }


        public Client getClientById(long id)
        {
            var a = db.Clients.Where(x => x.UserId == id).SingleOrDefault();
            return a;
        }


        public int Login(string Username, string Password, bool isLoginAdmin = false)
        {
            var result = db.Users.SingleOrDefault(x => x.UserName == Username && x.Password == Password);
            if (result == null)
            {
                return 0;
            }
            else
            {
                if (isLoginAdmin == true)
                {
                    if (result.GroupID == CommonConstans.ADMIN_GROUP || result.GroupID == CommonConstans.MOD_GROUP)
                    {
                        if (result.Status == false)
                        {
                            return -1;
                        }
                        if (result.Password == Password)
                            return 1;
                        else
                            return 2;
                    }
                    else
                    {
                        return -3;
                    }
                }
                else
                {
                    if (result.Status == false)
                    {
                        return -1;
                    }
                    if (result.Password == Password)
                        return 1;
                    else
                        return 2;
                }

            }
        }

    }
}