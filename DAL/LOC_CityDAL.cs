using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data;
namespace ECommerce.DAL
{
    public class LOC_CityDAL : DALConnection
    {
        public DataTable PR_LOC_City_SelectAll()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_LOC_City_SelectAll");

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

        public DataTable PR_LOC_City_SelectByPK(int? CityID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_LOC_City_SelectByPK");
                sqlDB.AddInParameter(dbCMD, "CityID", SqlDbType.Int, CityID);

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

        public bool? PR_LOC_Save_City(int? CityID,int? StateID,int? CountryID,string? CityName,string? CityCode)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD;
                if(CityID == null)
                {
                    dbCMD = sqlDB.GetStoredProcCommand("PR_LOC_City_Insert");
                }
                else
                {
                    dbCMD = sqlDB.GetStoredProcCommand("PR_LOC_City_UpdateByPK");
                    sqlDB.AddInParameter(dbCMD, "@CityID",SqlDbType.Int, CityID);
                }
                sqlDB.AddInParameter(dbCMD, "@CityName",SqlDbType.VarChar, CityName);
                sqlDB.AddInParameter(dbCMD, "@CityCode",SqlDbType.VarChar, CityCode);
                sqlDB.AddInParameter(dbCMD, "@CountryID",SqlDbType.Int, CountryID);
                sqlDB.AddInParameter(dbCMD, "@StateID",SqlDbType.Int, StateID);

                int vReturnValue = sqlDB.ExecuteNonQuery(dbCMD);
                return (vReturnValue == -1 ? false : true);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public bool? PR_LOC_City_Delete(int? CityId)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_LOC_City_DeleteByPK");
                sqlDB.AddInParameter(dbCMD, "CityId", SqlDbType.Int, CityId);
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
