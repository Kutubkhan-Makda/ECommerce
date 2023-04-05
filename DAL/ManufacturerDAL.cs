using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data.Common;
using System.Data;

namespace ECommerce.DAL
{
    public class ManufacturerDAL:DALConnection
    {
        public DataTable PR_Manufacturer_SelectAll()
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Manufacturer_SelectAll");

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

        public bool? PR_Manufacturer_Delete(int? ManufacturerId)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Manufacturer_DeleteByPK");
                sqlDB.AddInParameter(dbCMD, "ManufacturerId", SqlDbType.Int, ManufacturerId);
                int vReturnValue = sqlDB.ExecuteNonQuery(dbCMD);
                return (vReturnValue == -1 ? false : true);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataTable PR_Manufacturer_SelectbyPK(int? ManufacturerId)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_Manufacturer_SelectByPK");
                sqlDB.AddInParameter(dbCMD, "ManufacturerId", SqlDbType.Int, ManufacturerId);

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

        public bool? PR_Manufacturer_Save(int? ManufacturerId,string? ManufacturerName)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(SQL_Connection);
                DbCommand dbCMD;
                if(ManufacturerId == null)
                {
                    dbCMD = sqlDB.GetStoredProcCommand("PR_Manufacturer_Insert");
                }
                else
                {
                    dbCMD = sqlDB.GetStoredProcCommand("PR_Manufacturer_UpdateByPK");
                    sqlDB.AddInParameter(dbCMD, "@ManufacturerId",SqlDbType.Int, ManufacturerId);
                }
                sqlDB.AddInParameter(dbCMD, "@ManufacturerName",SqlDbType.VarChar, ManufacturerName);

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
