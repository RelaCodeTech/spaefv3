using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;


namespace SpaEFV3.ViewModels.TaxMaster
{
    /// <summary>
    /// List View Model for TaxMaster
    /// </summary>
    public class TaxMasterListViewModel
    {
        [Display(Name = "Tax ID")]
        public int Tax_ID { get; set; }

        [Display(Name = "Country ID")]
        public int Country_ID { get; set; }

        [Display(Name = "Tax Short Nm")]
        public string Tax_Short_Name { get; set; }

        [Display(Name = "Tax Desc")]
        public string Tax_Description { get; set; }

        [Display(Name = "Country")]
        public string CountryName { get; set; }

    }
}