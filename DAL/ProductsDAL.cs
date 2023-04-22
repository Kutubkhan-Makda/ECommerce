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

        public bool? PR_Product_Delete(int? ProductId)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Product_DeleteByPK");
                sqlDB.AddInParameter(dbCMD, "ProductId", SqlDbType.Int, ProductId);
                int vReturnValue = sqlDB.ExecuteNonQuery(dbCMD);
                return (vReturnValue == -1 ? false : true);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataTable PR_Product_SelectbyPK(int? ProductId)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Product_SelectbyPK");
                sqlDB.AddInParameter(dbCMD, "ProductId", SqlDbType.Int, ProductId);

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

        public bool? PR_Product_Save(int? ProductId,int? CategoryId,string? Name,int? ManufacturerId,string? Description,decimal? Price,decimal? Discount,int? Quantity,string? ImageUrl)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD;
                if(ProductId == null)
                {
                    dbCMD = sqlDB.GetStoredProcCommand("PR_Product_Insert");
                }
                else
                {
                    dbCMD = sqlDB.GetStoredProcCommand("PR_Product_UpdateByPK");
                    sqlDB.AddInParameter(dbCMD, "@ProductId",SqlDbType.Int, ProductId);
                }
                sqlDB.AddInParameter(dbCMD, "@CategoryId",SqlDbType.Int, CategoryId);
                sqlDB.AddInParameter(dbCMD, "@Name",SqlDbType.VarChar, Name);
                sqlDB.AddInParameter(dbCMD, "@ManufacturerId",SqlDbType.Int, ManufacturerId);
                sqlDB.AddInParameter(dbCMD, "@Description",SqlDbType.VarChar, Description);
                sqlDB.AddInParameter(dbCMD, "@Price",SqlDbType.Decimal, Price);
                sqlDB.AddInParameter(dbCMD, "@Discount",SqlDbType.Decimal, Discount);
                sqlDB.AddInParameter(dbCMD, "@Quantity",SqlDbType.Int, Quantity);
                sqlDB.AddInParameter(dbCMD, "@ImageUrl",SqlDbType.VarChar, ImageUrl);

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
