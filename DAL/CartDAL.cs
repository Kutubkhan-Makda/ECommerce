using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data;
using ECommerce.Auth;

namespace ECommerce.DAL
{
    public class CartDAL:DALConnection
    {
        public DataTable PR_Cart_SelectbyUser()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Cart_SelectbyUser");
                sqlDB.AddInParameter(dbCMD, "UserId", SqlDbType.Int, @CV.UserID());

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

        public bool? PR_Cart_InsertItem(int? ProductId,int? Quantity,decimal? TotalPrice)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Cart_Insert");
                sqlDB.AddInParameter(dbCMD, "UserId", SqlDbType.Int, @CV.UserID());
                sqlDB.AddInParameter(dbCMD, "@ProductId",SqlDbType.Int, ProductId);
                sqlDB.AddInParameter(dbCMD, "@Quantity",SqlDbType.Int, Quantity);
                sqlDB.AddInParameter(dbCMD, "@TotalPrice",SqlDbType.Decimal, TotalPrice);

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