using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data;

namespace ECommerce.DAL
{
    public class ProductsDAL:DALConnection
    {
        public DataTable PR_Product_SelectAll()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Product_SelectAll");

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
    }
}
