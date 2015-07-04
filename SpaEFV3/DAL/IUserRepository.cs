using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SpaEFV3.DAL
{
    /// <summary>
    /// Interface for User related actions
    /// </summary>
    public interface IUserRepository : IDisposable
    {
        string Login(SpaEFV3.Models.User LoggedUser);
        string SignUpUser(SpaEFV3.Models.User NewUser);
    }
}