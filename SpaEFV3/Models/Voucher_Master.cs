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
    
    public partial class Voucher_Master
    {
        public Voucher_Master()
        {
            this.Voucher_Usage = new HashSet<Voucher_Usage>();
        }
    
        public int Voucher_ID { get; set; }
        public decimal Voucher_Amount { get; set; }
        public System.DateTime Voucher_Created_Dt { get; set; }
        public Nullable<System.DateTime> Voucher_Expiry_Dt { get; set; }
        public string Voucher_Created_By { get; set; }
    
        public virtual ICollection<Voucher_Usage> Voucher_Usage { get; set; }
    }
}