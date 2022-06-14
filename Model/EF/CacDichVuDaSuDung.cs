namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CacDichVuDaSuDung")]
    public partial class CacDichVuDaSuDung
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long Id_MEF { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long Id_DetailsService { get; set; }

        public int? Total { get; set; }

        public virtual DetailsService DetailsService { get; set; }

        public virtual MedicalExaminationForm MedicalExaminationForm { get; set; }
    }
}
