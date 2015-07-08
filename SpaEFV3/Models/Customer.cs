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
    
    public partial class Customer
    {
        public Customer()
        {
            this.Orders = new HashSet<Order>();
            this.Customer_Membership_Details = new HashSet<Customer_Membership_Details>();
        }
    
        [Display(Name="Customer ID")]
        public int Customer_ID { get; set; }

        [Display(Name = "First name")]
        public string Customer_Fname { get; set; }

        [Display(Name = "Last name")]
        public string Customer_Lname { get; set; }

        [Display(Name = "Gender")]
        public string Customer_Gender { get; set; }

        [Display(Name = "Mobile No")]
        public string Customer_MobileNo { get; set; }

        [Display(Name = "DOB")]
        public Nullable<System.DateTime> Customer_DOB { get; set; }

        [Display(Name = "Email ID")]
        public string Customer_EmailID { get; set; }

        [Display(Name = "Alt Mobile No")]
        public string Customer_AltMobileNo { get; set; }

        [Display(Name = "Location ID")]
        public int Customer_Created_Loc_ID { get; set; }

        [Display(Name = "Created by")]
        public string Customer_CreatedBy { get; set; }

        [Display(Name = "Is Active")]
        public string Customer_Is_Active { get; set; }

        [Display(Name = "Created Dt")]
        public System.DateTime Customer_Created_Dt { get; set; }

        [Display(Name = "Updated Dt")]
        public System.DateTime Customer_Updated_Dt { get; set; }
    
        public virtual Location Location { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
        public virtual ICollection<Customer_Membership_Details> Customer_Membership_Details { get; set; }
    }
}
