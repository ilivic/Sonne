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
    
    public partial class acceptance
    {
        public int id_acc { get; set; }
        public System.DateTime DateAnswer { get; set; }
        public int User_id { get; set; }
        public int app_id { get; set; }
        public bool Result { get; set; }
        public string Comment { get; set; }
        public int Color_id { get; set; }
    
        public virtual applicants applicants { get; set; }
        public virtual Color Color { get; set; }
        public virtual Users Users { get; set; }
    }
}
