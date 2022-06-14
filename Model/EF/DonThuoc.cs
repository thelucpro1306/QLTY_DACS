namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DonThuoc")]
    public partial class DonThuoc
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DonThuoc()
        {
            CTToaThuocs = new HashSet<CTToaThuoc>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long Id { get; set; }

        public DateTime? DateCreate { get; set; }

        public long? id_Form { get; set; }

        public long? id_ill { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTToaThuoc> CTToaThuocs { get; set; }

        public virtual DeltailsMedicalForm DeltailsMedicalForm { get; set; }
    }
}
