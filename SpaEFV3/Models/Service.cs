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
    
    public partial class Service
    {
        public Service()
        {
            this.Purchase_Order = new HashSet<Purchase_Order>();
            this.Xref_Location_Service = new HashSet<Xref_Location_Service>();
            this.Xref_Service_Treatment = new HashSet<Xref_Service_Treatment>();
        }
    
        public int Service_ID { get; set; }
        public string Service_Name { get; set; }
        public string Service_Description { get; set; }
        public System.DateTime Service_Created_Dt { get; set; }
        public System.DateTime Service_Updated_Dt { get; set; }
        public string Service_Created_By { get; set; }
    
        public virtual ICollection<Purchase_Order> Purchase_Order { get; set; }
        public virtual ICollection<Xref_Location_Service> Xref_Location_Service { get; set; }
        public virtual ICollection<Xref_Service_Treatment> Xref_Service_Treatment { get; set; }
    }
}
