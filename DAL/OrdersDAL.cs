using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data;
using ECommerce.Auth;

namespace ECommerce.DAL
{
    public class OrdersDAL:DALConnection
    {
        public DataTable PR_Order_SelectLatest()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Order_SelectLatest");
                sqlDB.AddInParameter(dbCMD, "@UserId", SqlDbType.Int, CV.UserId());
                sqlDB.AddInParameter(dbCMD, "@OrderId",SqlDbType.Int, DBNull.Value);

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

        public bool? PR_Orders_Insert(int? OrderId,string? ShippingAddress)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD; 
                if(OrderId == null)
                {
                    dbCMD = sqlDB.GetStoredProcCommand("PR_Orders_Insert");
                    sqlDB.AddInParameter(dbCMD, "UserId", SqlDbType.Int, @CV.UserId());                
                    sqlDB.AddInParameter(dbCMD, "@ShippingAddress",SqlDbType.VarChar, @CV.Address());
                }
                else
                {
                    dbCMD = sqlDB.GetStoredProcCommand("PR_Orders_UpdateByPK");
                    sqlDB.AddInParameter(dbCMD, "@OrderId",SqlDbType.Int, OrderId);
                    sqlDB.AddInParameter(dbCMD, "@ShippingAddress",SqlDbType.VarChar, ShippingAddress);
                }
                sqlDB.AddInParameter(dbCMD, "@OrderDate",SqlDbType.DateTime, DBNull.Value);

                int vReturnValue = sqlDB.ExecuteNonQuery(dbCMD);
                return (vReturnValue == -1 ? false : true);
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
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_OrderItems_Insert");
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