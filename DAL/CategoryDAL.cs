using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data;

namespace ECommerce.DAL
{
    public class CategoryDAL:DALConnection
    {
        public DataTable PR_Category_SelectAll()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Category_SelectAll");

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

        public bool? PR_Category_Delete(int? CategoryId)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Category_DeleteByPK");
                sqlDB.AddInParameter(dbCMD, "CategoryId", SqlDbType.Int, CategoryId);
                
                int vReturnValue = sqlDB.ExecuteNonQuery(dbCMD);
                return (vReturnValue == -1 ? false : true);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataTable PR_Category_SelectbyPK(int? CategoryId)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Category_SelectbyPK");
                sqlDB.AddInParameter(dbCMD, "CategoryId", SqlDbType.Int, CategoryId);

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

        public bool? PR_Category_Save(int? CategoryId,string? CategoryName)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD;
                if(CategoryId == null)
                {
                    dbCMD = sqlDB.GetStoredProcCommand("PR_Category_Insert");
                }
                else
                {
                    dbCMD = sqlDB.GetStoredProcCommand("PR_Category_UpdateByPK");
                    sqlDB.AddInParameter(dbCMD, "@CategoryId",SqlDbType.Int, CategoryId);
                }
                sqlDB.AddInParameter(dbCMD, "@CategoryName",SqlDbType.VarChar, CategoryName);
                sqlDB.AddInParameter(dbCMD, "@CreatedON",SqlDbType.Date, DBNull.Value);

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
