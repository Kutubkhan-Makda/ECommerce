using EMedicine.Models;
using System.Data.SqlClient;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data.Common;

namespace EMedicine.Models
{
    public class DAL:DALConnection
    {
        public Response register(Users users)
        {
            Response response = new Response();
            SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
            DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_LOC_State_SelectAll");
            sqlDB.AddInParameter(dbCMD, "@Name", SqlDbType.VarChar, users.Name);
            sqlDB.AddInParameter(dbCMD, "@Email", SqlDbType.VarChar, users.Email);
            sqlDB.AddInParameter(dbCMD, "@Password", SqlDbType.VarChar, users.Password);
            sqlDB.AddInParameter(dbCMD, "@Address", SqlDbType.VarChar, users.Address);
            sqlDB.AddInParameter(dbCMD, "@Type", SqlDbType.VarChar, "users");
            sqlDB.AddInParameter(dbCMD, "@Status", SqlDbType.Int, 1);
            sqlDB.AddInParameter(dbCMD, "@CreatedON",SqlDbType.DateTime, DBNull.Value);
            int vReturnValue = sqlDB.ExecuteNonQuery(dbCMD);
            
            if(vReturnValue > 0)
            {
                response.StatusCode = 200;
                response.StatusMessage = "User Registerd Successfully";
            }
            else
            {
                response.StatusCode = 100;
                response.StatusMessage = "User Registerd Failed";
            }

            return response;
        }

        public Response Login(Users users)
        {
            Response response = new Response();
            SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
            DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_LOC_State_SelectAll");
            sqlDB.AddInParameter(dbCMD, "@Email", SqlDbType.VarChar, users.Email);
            sqlDB.AddInParameter(dbCMD, "@Password", SqlDbType.VarChar, users.Password);

            DataTable dt = new DataTable();
            using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
            {
                dt.Load(dr);
            }

            Users user = new Users();

            if(dt.Rows.Count>0)
            {
                user.UserId = Convert.ToInt32(dt.Rows[0]["UserId"]);
                user.Name = Convert.ToString(dt.Rows[0]["Name"]);
                user.Email = Convert.ToString(dt.Rows[0]["Email"]);
                user.Address = Convert.ToString(dt.Rows[0]["Address"]);
                user.Type = Convert.ToString(dt.Rows[0]["Type"]);
                response.StatusCode = 200;
                response.StatusMessage ="User Login Successfull";
                response.user = user;
            }
            else
            {
                response.StatusCode = 100;
                response.StatusMessage ="User Not Found";
                response.user = null;
            }
            return response;
        }

        public Response viewUser(Users users)
        {
            Response response = new Response();
            SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
            DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_LOC_State_SelectAll");
            sqlDB.AddInParameter(dbCMD, "@UserId", SqlDbType.VarChar, users.UserId);
            DataTable dt = new DataTable();
            using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
            {
                dt.Load(dr);
            }

            Users user = new Users();

            if(dt.Rows.Count>0)
            {
                user.UserId = Convert.ToInt32(dt.Rows[0]["UserId"]);
                user.Name = Convert.ToString(dt.Rows[0]["Name"]);
                user.Email = Convert.ToString(dt.Rows[0]["Email"]);
                user.Address = Convert.ToString(dt.Rows[0]["Address"]);
                user.Type = Convert.ToString(dt.Rows[0]["Type"]);
                user.CreatedON = Convert.ToDateTime(dt.Rows[0]["CreatedON"]);

                response.StatusCode = 200;
                response.StatusMessage ="User Exist";
                response.user = user;
            }
            else
            {
                response.StatusCode = 100;
                response.StatusMessage ="User Not Found";
                response.user = null;
            }
            return response;
        }

        public Response updateProfile(Users users)
        {
            Response response = new Response();
            SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
            DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_LOC_State_SelectAll");
            sqlDB.AddInParameter(dbCMD, "@UserId", SqlDbType.VarChar, users.UserId);
            sqlDB.AddInParameter(dbCMD, "@Name", SqlDbType.VarChar, users.Name);
            sqlDB.AddInParameter(dbCMD, "@Email", SqlDbType.VarChar, users.Email);
            sqlDB.AddInParameter(dbCMD, "@Password", SqlDbType.VarChar, users.Password);
            sqlDB.AddInParameter(dbCMD, "@Address", SqlDbType.VarChar, users.Address);

            int vReturnValue = sqlDB.ExecuteNonQuery(dbCMD);
            if(vReturnValue>0)
            {
                response.StatusCode = 200;
                response.StatusMessage ="Profile Update Successfull";
            }
            else
            {
                response.StatusCode = 200;
                response.StatusMessage ="Profile Update Failed";
            }

            return response;
        }
    }
}