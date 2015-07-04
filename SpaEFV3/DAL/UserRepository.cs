using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SpaEFV3.DAL
{
    /// <summary>
    /// DB methods for USER actions
    /// </summary>
    public class UserRepository : IUserRepository, IDisposable
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SpaDb"].ToString());

        /// <summary>
        /// Login user
        /// </summary>
        /// <param name="LoggedUser">user</param>
        /// <returns>Y = success; N = failed</returns>
        public string Login(SpaEFV3.Models.User LoggedUser)
        {
            string isLoginSuccess = String.Empty;


            try
            {
                SqlCommand cmd = new SqlCommand("dbo.USER_LOGGED_IN", this.con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@USER_ID", LoggedUser.User_ID);
                cmd.Parameters.AddWithValue("@PWD", LoggedUser.Pwd);

                SqlParameter outParam = new SqlParameter("@IS_VALID", SqlDbType.Char);
                outParam.Direction = ParameterDirection.Output;
                outParam.Size = 1;
                cmd.Parameters.Add(outParam);

                this.con.Open();
                cmd.ExecuteNonQuery();

                isLoginSuccess = outParam.Value.ToString();
            }
            catch (Exception ee)
            {
                //this.con.Close();
                throw ee;
            }
            finally
            {
                this.con.Close();
            }

            return isLoginSuccess;
        }

        /// <summary>
        /// Signup/adds new user
        /// </summary>
        /// <param name="NewUser">user</param>
        /// <returns>DB msg string in case of error</returns>
        public string SignUpUser(SpaEFV3.Models.User NewUser)
        {
            string sSignUpDBMsg = String.Empty;

            try
            {
                SqlCommand cmd = new SqlCommand("dbo.ADD_USER", this.con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@USER_ID", NewUser.User_ID);
                cmd.Parameters.AddWithValue("@PWD", NewUser.Pwd);
                cmd.Parameters.AddWithValue("@ROLE", NewUser.Role);
                cmd.Parameters.AddWithValue("@USER_FNAME", NewUser.User_Fname);
                cmd.Parameters.AddWithValue("@USER_LNAME", NewUser.User_Lname);

                SqlParameter outParam = new SqlParameter("@MSG", SqlDbType.VarChar);
                outParam.Direction = ParameterDirection.Output;
                outParam.Size = 100;
                cmd.Parameters.Add(outParam);

                this.con.Open();
                cmd.ExecuteNonQuery();

                sSignUpDBMsg = outParam.Value.ToString();
            }
            catch (Exception ee)
            {
                //this.con.Close();
                throw ee;
            }
            finally
            {
                this.con.Close();
            }

            return sSignUpDBMsg;
        }

        /// <summary>
        /// Dispose method implementation
        /// </summary>
        public void Dispose()
        {
            //Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}