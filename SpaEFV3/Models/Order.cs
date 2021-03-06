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
    using System.ComponentModel.DataAnnotations;
    
    public partial class Order
    {
        public Order()
        {
            this.Order_Payment_Mode = new HashSet<Order_Payment_Mode>();
            this.Purchase_Order = new HashSet<Purchase_Order>();
            this.Voucher_Usage = new HashSet<Voucher_Usage>();
            this.Location_Tax = new HashSet<Location_Tax>();

            this.Service = new HashSet<Service>();
            this.Xref_Location_Service = new HashSet<Xref_Location_Service>();
            this.Voucher_Master = new HashSet<Voucher_Master>();
        }


        [Display(Name = "Order ID")]
        public int Order_ID { get; set; }

        [Display(Name = "Customer ID")]
        public int Customer_ID { get; set; }

        [Display(Name = "Order Date")]
        public System.DateTime Order_Dt { get; set; }

        [Display(Name = "Order Loc ID")]
        public int Order_Loc_ID { get; set; }

        [Display(Name = "Currency")]
        public string Order_Currency_Code { get; set; }

        [Display(Name = "Order Gross Amt")]
        public Nullable<decimal> Order_Gross_Amount { get; set; }

        [Display(Name = "Order Net Amt")]
        public Nullable<decimal> Order_Net_Amount { get; set; }

        [Display(Name = "Voucher Usage ID")]
        public Nullable<int> Voucher_Usage_ID { get; set; }

        [Display(Name = "Order Comments")]
        public string Order_Comments { get; set; }

        [Display(Name = "Created By")]
        public string Order_Created_By { get; set; }

        [Display(Name = "Updated Dt")]
        public Nullable<System.DateTime> Order_Updated_Dt { get; set; }

        [Display(Name = "Updated By")]
        public string Order_Updated_By { get; set; }
    
        public virtual Customer Customer { get; set; }
        public virtual Location Location { get; set; }
        public virtual ICollection<Order_Payment_Mode> Order_Payment_Mode { get; set; }
        public virtual ICollection<Purchase_Order> Purchase_Order { get; set; }
        public virtual ICollection<Voucher_Usage> Voucher_Usage { get; set; }
        public virtual ICollection<Location_Tax> Location_Tax { get; set; }

        public virtual ICollection<Service> Service { get; set; }
        public virtual ICollection<Xref_Location_Service> Xref_Location_Service { get; set; }
        public virtual ICollection<Voucher_Master> Voucher_Master { get; set; }

    }
}
