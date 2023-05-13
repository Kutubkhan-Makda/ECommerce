using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data;
using ECommerce.Auth;

namespace ECommerce.DAL
{
    public class OrdersDAL:DALConnection
    {
        //public DataTable PR_Cart_SelectbyUser(int? UserId)
        //{
        //    try
        //    {
        //        SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
        //        DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Cart_SelectbyUser");
        //        sqlDB.AddInParameter(dbCMD, "UserId", SqlDbType.Int, UserId);
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

        public bool? PR_Orders_Insert(int? OrderId,string? ShippingAddress)
        {
            SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD; 
                if(OrderId == null)
                {
                    dbCMD = sqlDB.GetStoredProcCommand("PR_Orders_Insert");
                    sqlDB.AddInParameter(dbCMD, "UserId", SqlDbType.Int, @CV.UserId());
                    sqlDB.AddInParameter(dbCMD, "@OrderDate",SqlDbType.DateTime, DBNull.Value);
                    sqlDB.AddInParameter(dbCMD, "@ShippingAddress",SqlDbType.VarChar, @CV.Address());
                }
                else
                {
                    dbCMD = sqlDB.GetStoredProcCommand("PR_Orders_UpdateByPK");
                    sqlDB.AddInParameter(dbCMD, "@OrderId",SqlDbType.Int, OrderId);
                    sqlDB.AddInParameter(dbCMD, "@ShippingAddress",SqlDbType.VarChar, ShippingAddress);
                }

                int vReturnValue = sqlDB.ExecuteNonQuery(dbCMD);
                return (vReturnValue == -1 ? false : true);
            try
            {
                
            }
            catch (Exception ex)
            {
                return null;    
            }
        }

        public bool? PR_OrdersItem_Insert(int? OrderId,int? ProductId,int? Quantity,decimal? Price)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Cart_Insert");
                sqlDB.AddInParameter(dbCMD, "OrderId", SqlDbType.Int, DBNull.Value);
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