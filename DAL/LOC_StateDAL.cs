using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data;
namespace ECommerce.DAL
{
    public class LOC_StateDAL : DALConnection
    {
        public DataTable PR_LOC_State_SelectAll()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_LOC_State_SelectAll");

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

        public DataTable PR_LOC_State_SelectByPK(int? StateId)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_LOC_State_SelectByPK");
                sqlDB.AddInParameter(dbCMD, "StateId", SqlDbType.Int, StateId);

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

        public bool? PR_LOC_Save_State(int? StateId,int? CountryId,string? StateName,string? StateCode)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD;
                if(StateId == null)
                {
                    dbCMD = sqlDB.GetStoredProcCommand("PR_LOC_State_Insert");
                }
                else
                {
                    dbCMD = sqlDB.GetStoredProcCommand("PR_LOC_State_UpdateByPK");
                    sqlDB.AddInParameter(dbCMD, "@StateId",SqlDbType.Int, StateId);
                }
                sqlDB.AddInParameter(dbCMD, "@StateName",SqlDbType.VarChar, StateName);
                sqlDB.AddInParameter(dbCMD, "@StateCode",SqlDbType.VarChar, StateCode);
                sqlDB.AddInParameter(dbCMD, "@CountryId",SqlDbType.Int, CountryId);
                
                int vReturnValue = sqlDB.ExecuteNonQuery(dbCMD);
                return (vReturnValue == -1 ? false : true);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataTable PR_LOC_State_SelectByDropdownList(int? CountryID)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_LOC_State_SelectForDropDownByCountryID");
                sqlDB.AddInParameter(dbCMD, "CountryID", SqlDbType.Int, CountryID);

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

        public bool? PR_LOC_State_Delete(int? StateId)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_LOC_State_DeleteByPK");
                sqlDB.AddInParameter(dbCMD, "StateId", SqlDbType.Int, StateId);
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