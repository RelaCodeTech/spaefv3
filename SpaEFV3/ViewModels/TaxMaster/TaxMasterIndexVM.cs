using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SpaEFV3.ViewModels.TaxMaster
{
    /// <summary>
    /// TaxMaster View Model for Index Page
    /// </summary>
    public class TaxMasterIndexVM
    {
        public IList<SpaEFV3.ViewModels.TaxMaster.TaxMasterListViewModel> TaxMasterList { get; set; }
        public TaxMasterListViewModel NewTax { get; set; }
    }
}