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
                sqlDB.AddInParameter(dbCMD, "UserId", SqlDbType.Int, @CV.UserId());

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

        //public DataTable PR_Cart_SelectAll()
        //{
        //    try
        //    {
        //        SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
        //        DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Cart_SelectAll");
        //        //sqlDB.AddInParameter(dbCMD, "UserId", SqlDbType.Int, @CV.UserId());
//
        //        DataTable dt = new DataTable();
        //        using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
        //        {
        //            dt.Load(dr);
        //        }
        //        return dt;
//
        //    }
        //    catch (Exception ex)
        //    {
        //        return null;
        //    }
        //}

        public bool? PR_Cart_Delete(int? CartId)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Cart_DeleteByPK");
                sqlDB.AddInParameter(dbCMD, "CartId", SqlDbType.Int, CartId);
                sqlDB.AddInParameter(dbCMD, "UserId", SqlDbType.Int, @CV.UserId());
                
                int vReturnValue = sqlDB.ExecuteNonQuery(dbCMD);
                return (vReturnValue == -1 ? false : true);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public bool? PR_Cart_InsertItem(int? ProductId,int? Quantity,decimal? Price)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Cart_Insert");
                sqlDB.AddInParameter(dbCMD, "UserId", SqlDbType.Int, @CV.UserId());
                sqlDB.AddInParameter(dbCMD, "@ProductId",SqlDbType.Int, ProductId);
                sqlDB.AddInParameter(dbCMD, "@Quantity",SqlDbType.Int, Quantity);
                sqlDB.AddInParameter(dbCMD, "@Price",SqlDbType.Decimal, Price);

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