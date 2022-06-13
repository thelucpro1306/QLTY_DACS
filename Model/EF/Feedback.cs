namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Feedback")]
    public partial class Feedback
    {
        public long ID { get; set; }

        public DateTime CreateTime { get; set; }

        public int? EntityID { get; set; }

        public long? Serviced_Id { get; set; }

        [StringLength(250)]
        public string text { get; set; }

        public long? User_id { get; set; }

        public long? RecordID { get; set; }

        public virtual Service Service { get; set; }

        public virtual User User { get; set; }
    }
}
