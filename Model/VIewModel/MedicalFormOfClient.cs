using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.VIewModel
{
    public class MedicalFormOfClient
    {
        public long ClientId { get; set; }
        public string Name { get; set; }

        public DateTime? Dob { get; set; }

        public bool gender { get; set; }

        public string email { get; set; }   

        public string phone { get; set; }   
        public string Address { get; set; }

        public long? Form_Id { get; set; }

        public long? User_Id { get; set; }

        public long MedicalExamFormId { get; set; }

        public string PetName { get; set; }
        
        public double? petWeight { get; set; }

        public string HairColor { get; set; }

        public string Species { get; set; }

        public bool? petGender { get; set; }

        public string Image { get; set; }

        public DateTime? CreateDate { get; set; }

        public override string ToString()
        {
            return base.ToString();
        }
    }
}
