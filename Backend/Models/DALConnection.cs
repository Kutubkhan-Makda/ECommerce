using System.Data;
using System.Reflection;

namespace EMedicine.Models
{
    public class DALConnection
    {
        public static string SQL_Connection = new ConfigurationBuilder().AddJsonFile("appsettings.json").Build().GetConnectionString("SQL_EMedicine");
    }
}