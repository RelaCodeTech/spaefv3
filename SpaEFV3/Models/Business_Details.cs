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
    
    public partial class Business_Details
    {
        public Business_Details()
        {
            this.Membership_Master = new HashSet<Membership_Master>();
        }
    
        public int Business_ID { get; set; }
        public string Business_Address { get; set; }
        public string Business_City { get; set; }
        public string Business_State { get; set; }
        public string Business_Org_Country { get; set; }
        public string Business_Is_Registered { get; set; }
        public string Business_Description { get; set; }
        public System.DateTime Business_Created_Dt { get; set; }
        public System.DateTime Business_Updated_Dt { get; set; }
        public string Business_Updated_By { get; set; }
    
        public virtual Business Business { get; set; }
        public virtual ICollection<Membership_Master> Membership_Master { get; set; }
    }
}
