namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DeltailsMedicalForm")]
    public partial class DeltailsMedicalForm
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long id_Form { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long id_ill { get; set; }

        [StringLength(120)]
        public string Symptom { get; set; }

        [StringLength(150)]
        public string Diagnose { get; set; }

        public long? id_Doctor { get; set; }

        public virtual Doctor Doctor { get; set; }

        public virtual illness illness { get; set; }

        public virtual MedicalExaminationForm MedicalExaminationForm { get; set; }
    }
}
