//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Terminal.ADOApp
{
    using System;
    using System.Collections.Generic;
    
    public partial class academicApplicant
    {
        public int id_AA { get; set; }
        public int app_id { get; set; }
        public int academic_id { get; set; }
        public double result { get; set; }
    
        public virtual academics academics { get; set; }
        public virtual applicants applicants { get; set; }
    }
}
