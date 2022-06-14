using Model.EF;
using Model.VIewModel;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class ClientDao
    {
        OnlineShopDBContext db = null;
        public ClientDao()
        {
            db = new OnlineShopDBContext(); 
        }

        public Client getClientByUserId(long id)
        {
            return db.Clients.Where(c => c.UserId == id).FirstOrDefault();   
        }

        public IEnumerable<Client> ListAllPaging(string searchString, int page, int pageSize)
        {
            IOrderedQueryable<Client> query = db.Clients;
            if (!string.IsNullOrEmpty(searchString))
            {
                query = query.Where(x => x.Name.Contains(searchString) || x.Phone.Contains(searchString))
                    .OrderBy(p => p.Name);
            }
            return query.OrderBy(p => p.Name).ToPagedList(page, pageSize);
        }

        public List<MedicalFormOfClient> ListFormByClient (long ClientId)
        {
            var model = from a in db.Clients
                        join b in db.MedicalExaminationForms
                        on a.id equals b.ClientId
                        where a.id == ClientId
                        select new MedicalFormOfClient()
                        {
                            ClientId = a.id,
                            Name = a.Name,
                            Dob = a.dob,
                            gender = a.gender,
                            email = a.email,
                            phone = a.Phone,
                            Address = a.Address,
                            Form_Id = a.id,
                            User_Id = a.UserId,
                            MedicalExamFormId = b.id,
                            PetName = b.PetName,
                            petWeight = b.Weight,
                            HairColor = b.HairColor,
                            Species = b.Species,
                            petGender = b.PetGender,
                            Image = b.Image,
                            CreateDate = b.CreateDate
                        };
            model.OrderByDescending(x => x.CreateDate);
            return model.ToList();
        }

        public long Insert(Client cl)
        {
            db.Clients.Add(cl);
            db.SaveChanges();
            return cl.id;
        }


        public long Update(Client cl)
        {

            db.Clients.AddOrUpdate(cl);
            db.SaveChanges();
            return cl.id;
        }


        public Client ViewDetails(long id)
        {
            return db.Clients.Find(id);
        }

        public List<Appointment> getAppointmentByClientID(long id)
        {
            var a = db.Appointments.Where(x => x.ClientID == id).ToList();
            return a;
        }
    }
}
