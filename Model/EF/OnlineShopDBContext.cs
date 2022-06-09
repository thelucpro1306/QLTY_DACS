using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Model.EF
{
    public partial class OnlineShopDBContext : DbContext
    {
        public OnlineShopDBContext()
            : base("name=OnlineShopDBContext")
        {
        }

        public virtual DbSet<About> Abouts { get; set; }
        public virtual DbSet<Apointment> Apointments { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Client> Clients { get; set; }
        public virtual DbSet<Contact> Contacts { get; set; }
        public virtual DbSet<Content> Contents { get; set; }
        public virtual DbSet<ContentTag> ContentTags { get; set; }
        public virtual DbSet<Credential> Credentials { get; set; }
        public virtual DbSet<DeltailsMedicalForm> DeltailsMedicalForms { get; set; }
        public virtual DbSet<Doctor> Doctors { get; set; }
        public virtual DbSet<Faculty> Faculties { get; set; }
        public virtual DbSet<Feedback> Feedbacks { get; set; }
        public virtual DbSet<Footer> Footers { get; set; }
        public virtual DbSet<illness> illnesses { get; set; }
        public virtual DbSet<MedicalExaminationForm> MedicalExaminationForms { get; set; }
        public virtual DbSet<Menu> Menus { get; set; }
        public virtual DbSet<MenuType> MenuTypes { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ProductCategory> ProductCategories { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Servicess> Servicesses { get; set; }
        public virtual DbSet<Slide> Slides { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<SystemConfig> SystemConfigs { get; set; }
        public virtual DbSet<Tag> Tags { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<UserGroup> UserGroups { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<About>()
                .Property(e => e.Image)
                .IsUnicode(false);

            modelBuilder.Entity<Apointment>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<Apointment>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Apointment>()
                .HasMany(e => e.MedicalExaminationForms)
                .WithOptional(e => e.Apointment)
                .HasForeignKey(e => e.id_Appointment);

            modelBuilder.Entity<Category>()
                .Property(e => e.MetaTitle)
                .IsUnicode(false);

            modelBuilder.Entity<Client>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<Client>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<ContentTag>()
                .Property(e => e.TagID)
                .IsUnicode(false);

            modelBuilder.Entity<Credential>()
                .Property(e => e.UserGroupID)
                .IsUnicode(false);

            modelBuilder.Entity<Credential>()
                .Property(e => e.RoleID)
                .IsUnicode(false);

            modelBuilder.Entity<Doctor>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<Doctor>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Doctor>()
                .HasMany(e => e.DeltailsMedicalForms)
                .WithOptional(e => e.Doctor)
                .HasForeignKey(e => e.id_Doctor);

            modelBuilder.Entity<Faculty>()
                .HasMany(e => e.Doctors)
                .WithOptional(e => e.Faculty)
                .WillCascadeOnDelete();

            modelBuilder.Entity<Footer>()
                .Property(e => e.ID)
                .IsUnicode(false);

            modelBuilder.Entity<illness>()
                .HasMany(e => e.DeltailsMedicalForms)
                .WithRequired(e => e.illness)
                .HasForeignKey(e => e.id_ill)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MedicalExaminationForm>()
                .Property(e => e.PetName)
                .IsUnicode(false);

            modelBuilder.Entity<MedicalExaminationForm>()
                .Property(e => e.HairColor)
                .IsUnicode(false);

            modelBuilder.Entity<MedicalExaminationForm>()
                .Property(e => e.Species)
                .IsUnicode(false);

            modelBuilder.Entity<MedicalExaminationForm>()
                .Property(e => e.Image)
                .IsUnicode(false);

            modelBuilder.Entity<MedicalExaminationForm>()
                .HasMany(e => e.DeltailsMedicalForms)
                .WithRequired(e => e.MedicalExaminationForm)
                .HasForeignKey(e => e.id_Form)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.Price)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Product>()
                .Property(e => e.PromotionPrice)
                .HasPrecision(18, 0);

            modelBuilder.Entity<ProductCategory>()
                .Property(e => e.MetaTitle)
                .IsUnicode(false);

            modelBuilder.Entity<Role>()
                .Property(e => e.ID)
                .IsUnicode(false);

            modelBuilder.Entity<Servicess>()
                .Property(e => e.Image)
                .IsUnicode(false);

            modelBuilder.Entity<Servicess>()
                .HasMany(e => e.Apointments)
                .WithOptional(e => e.Servicess)
                .HasForeignKey(e => e.ServicesId);

            modelBuilder.Entity<Servicess>()
                .HasMany(e => e.Feedbacks)
                .WithOptional(e => e.Servicess)
                .HasForeignKey(e => e.Serviced_Id);

            modelBuilder.Entity<Slide>()
                .Property(e => e.Link)
                .IsUnicode(false);

            modelBuilder.Entity<SystemConfig>()
                .Property(e => e.ID)
                .IsUnicode(false);

            modelBuilder.Entity<Tag>()
                .Property(e => e.ID)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.UserName)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.GroupID)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.Feedbacks)
                .WithOptional(e => e.User)
                .HasForeignKey(e => e.User_id);

            modelBuilder.Entity<UserGroup>()
                .Property(e => e.ID)
                .IsUnicode(false);
        }
    }
}
