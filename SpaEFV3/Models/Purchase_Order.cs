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
    
    public partial class Purchase_Order
    {
        public int Order_ID { get; set; }
        public int Service_ID { get; set; }
        public Nullable<decimal> Service_Amount { get; set; }
        public Nullable<decimal> Service_Discount { get; set; }
    
        public virtual Order Order { get; set; }
        public virtual Service Service { get; set; }
    }
}