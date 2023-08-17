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

        public bool? PR_LOC_Save_State(int? StateID,int? CountryID,string? StateName,string? StateCode)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD;
                if(StateID == null)
                {
                    dbCMD = sqlDB.GetStoredProcCommand("PR_LOC_State_Insert");
                    sqlDB.AddInParameter(dbCMD, "@CreationDate",SqlDbType.Date, DBNull.Value);
                }
                else
                {
                    dbCMD = sqlDB.GetStoredProcCommand("PR_LOC_State_UpdateByPK");
                    sqlDB.AddInParameter(dbCMD, "@StateID",SqlDbType.Int, StateID);
                }
                sqlDB.AddInParameter(dbCMD, "@StateName",SqlDbType.VarChar, StateName);
                sqlDB.AddInParameter(dbCMD, "@StateCode",SqlDbType.VarChar, StateCode);
                sqlDB.AddInParameter(dbCMD, "@CountryID",SqlDbType.Int, CountryID);
                sqlDB.AddInParameter(dbCMD, "@ModificationDate",SqlDbType.Date, DBNull.Value);
                

                int vReturnValue = sqlDB.ExecuteNonQuery(dbCMD);
                return (vReturnValue == -1 ? false : true);
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