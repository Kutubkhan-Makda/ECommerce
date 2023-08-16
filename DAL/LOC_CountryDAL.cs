using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data;
namespace ECommerce.DAL
{
    public class LOC_CountryDAL : DALConnection
    {
        public DataTable PR_LOC_Country_SelectAll()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_LOC_Country_SelectAll");

                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
                {
                    dt.Load(dr);
                }
                return dt;

            }
            catch (Exception ex)
            {
                return null;
            }

        }

        public DataTable PR_LOC_Country_SelectByPK(int? CountryId)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_LOC_Country_SelectByPK");
                sqlDB.AddInParameter(dbCMD, "CountryId", SqlDbType.Int, CountryId);

                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
                {
                    dt.Load(dr);
                }

                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public bool? PR_LOC_Save_Country(int? CountryID,string? CountryName,string? CountryCode)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD;
                if(CountryID == null)
                {
                    dbCMD = sqlDB.GetStoredProcCommand("PR_LOC_Country_Insert");
                }
                else
                {
                    dbCMD = sqlDB.GetStoredProcCommand("PR_LOC_Country_UpdateByPK");
                    sqlDB.AddInParameter(dbCMD, "@CountryID",SqlDbType.Int, CountryID);
                }
                sqlDB.AddInParameter(dbCMD, "@CountryName",SqlDbType.VarChar, CountryName);
                sqlDB.AddInParameter(dbCMD, "@CountryCode",SqlDbType.VarChar, CountryCode);
                

                int vReturnValue = sqlDB.ExecuteNonQuery(dbCMD);
                return (vReturnValue == -1 ? false : true);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public bool? PR_LOC_Country_Delete(int? CountryId)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_LOC_Country_DeleteByPK");
                sqlDB.AddInParameter(dbCMD, "CountryId", SqlDbType.Int, CountryId);
                int vReturnValue = sqlDB.ExecuteNonQuery(dbCMD);
                return (vReturnValue == -1 ? false : true);
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
