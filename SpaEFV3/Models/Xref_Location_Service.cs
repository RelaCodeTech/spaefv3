//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SpaEFV3.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Xref_Location_Service
    {
        public int Location_Service_Xref_ID { get; set; }
        public int Loc_ID { get; set; }
        public int Service_ID { get; set; }
        public Nullable<decimal> Amount { get; set; }
    
        public virtual Location Location { get; set; }
        public virtual Service Service { get; set; }
    }
}