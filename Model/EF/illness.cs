namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("illness")]
    public partial class illness
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public illness()
        {
            DeltailsMedicalForms = new HashSet<DeltailsMedicalForm>();
        }

        public long id { get; set; }

        [StringLength(250)]
        public string illName { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DeltailsMedicalForm> DeltailsMedicalForms { get; set; }
    }
}
