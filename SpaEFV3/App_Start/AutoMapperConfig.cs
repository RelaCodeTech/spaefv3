using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SpaEFV3.Models;
using SpaEFV3.ViewModels.TaxMaster;

namespace SpaEFV3.App_Start
{
    /// <summary>
    /// AutoMapper mappings for classes
    /// </summary>
    public static class AutoMapperConfig
    {
        /// <summary>
        /// Add all mappings here
        /// </summary>
        public static void RegisterMappings()
        {
            //mapping -> TaxMaster.LookUp_Country.Country_Name to TaxMasterListViewModel.CountryName
            AutoMapper.Mapper.CreateMap<Tax_Master, TaxMasterListViewModel>()
                .ForMember(dest => dest.CountryName,
                opts => opts.MapFrom(src => src.LookUp_Country.Country_Name));
        }
    }
}