//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace antrentStat.ADOApp
{
    using System;
    using System.Collections.Generic;
    
    public partial class applicants
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public applicants()
        {
            this.academicApplicant = new HashSet<academicApplicant>();
            this.acceptance = new HashSet<acceptance>();
        }
    
        public int id_app { get; set; }
        public string FullName { get; set; }
        public System.DateTime DateBirt { get; set; }
        public bool IsTarget { get; set; }
        public int Color_id { get; set; }
        public bool isAchievement { get; set; }
        public double GPA { get; set; }
        public int Gender_id { get; set; }
        public System.DateTime dateCreate { get; set; }
        public string Phone { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<academicApplicant> academicApplicant { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<acceptance> acceptance { get; set; }
        public virtual Color Color { get; set; }
        public virtual Gender Gender { get; set; }
    }
}
