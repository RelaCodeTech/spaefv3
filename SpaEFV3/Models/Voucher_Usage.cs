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
    
    public partial class Voucher_Usage
    {
        public int Voucher_Usage_ID { get; set; }
        public int Voucher_ID { get; set; }
        public int Order_ID { get; set; }
    
        public virtual Order Order { get; set; }
        public virtual Voucher_Master Voucher_Master { get; set; }
    }
}
