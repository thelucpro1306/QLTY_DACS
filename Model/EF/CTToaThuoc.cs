namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CTToaThuoc")]
    public partial class CTToaThuoc
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long id_DonThuoc { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long id_Thuoc { get; set; }

        public int? amount { get; set; }

        public virtual DonThuoc DonThuoc { get; set; }

        public virtual Thuoc Thuoc { get; set; }

        [StringLength(50)]
        public string Note { get; set; }

    }
}
