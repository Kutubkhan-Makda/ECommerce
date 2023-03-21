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

            if(dt.Rows.Count>0)
            {
                response.StatusCode = 200;
                response.StatusMessage ="User Login Successfull";
            }
            else
            {
                response.StatusCode = 100;
                response.StatusMessage ="User Not Found";
            }
            return response;
        }
    }
}