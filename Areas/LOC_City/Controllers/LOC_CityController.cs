using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ECommerce.DAL;
using System.Data;
using ECommerce.Auth;

namespace ECommerce.Areas.LOC_City.Controllers
{
    [Area("LOC_City")]
    [Route("LOC_City/[Controller]/[action]")]
    //[CheckAdminAccess]
    public class LOC_CityController : Controller
    {
        LOC_CityDAL cityDAL = new LOC_CityDAL();
        // GET: LOC_CityController
        public ActionResult Admin()
        {
            DataTable dtCity = cityDAL.PR_LOC_City_SelectAll();
            return View("CityList",dtCity);
        }

        public IActionResult Add(int? CityID)
        {
            LOC_DAL dalLOC = new LOC_DAL();
            DataTable dtDropdownCountry = dalLOC.PR_LOC_Country_SelectByDropdownList();
            
            List<Areas.Models.LOC_CountryDropDownModel> listCountry = new List<Areas.Models.LOC_CountryDropDownModel>();
            foreach (DataRow dr in dtDropdownCountry.Rows)
            {
                Areas.Models.LOC_CountryDropDownModel modelLOC_CountryDropDown = new Areas.Models.LOC_CountryDropDownModel();
                modelLOC_CountryDropDown.CountryID = (Convert.ToInt32(dr["CountryID"]));
                modelLOC_CountryDropDown.CountryName = (Convert.ToString(dr["CountryName"]));
                listCountry.Add(modelLOC_CountryDropDown);
            }
            ViewBag.CountryList = listCountry;
            
            List<Areas.Models.LOC_StateDropDownModel> listState = new List<Areas.Models.LOC_StateDropDownModel>();
            ViewBag.StateList = listState;

            if (CityID != null)
            {
                DataTable dt = dalLOC.PR_LOC_City_SelectByPK(CityID);

                if (dt.Rows.Count > 0)
                {
                    LOC_CityModel modelLOC_City = new LOC_CityModel();
                    foreach (DataRow dr in dt.Rows)
                    {
                        modelLOC_City.CityID = (Convert.ToInt32(dr["CityID"]));
                        modelLOC_City.CityName = (Convert.ToString(dr["CityName"]));
                        modelLOC_City.CityCode = (Convert.ToString(dr["CityCode"]));
                        modelLOC_City.CreationDate = (Convert.ToDateTime(dr["CreationDate"]));
                        modelLOC_City.ModificationDate = (Convert.ToDateTime(dr["ModificationDate"]));
                        modelLOC_City.StateID = (Convert.ToInt32(dr["StateID"]));
                        modelLOC_City.CountryID = (Convert.ToInt32(dr["CountryID"]));
                    }

                    //String connectionstr = this.Configuration.GetConnectionString("SQL_AddressBook");
                    //SqlConnection conn1 = new SqlConnection(connectionstr);
                    //conn1.Open();
                    //SqlCommand cmd1 = conn1.CreateCommand();
                    //cmd1.CommandType = CommandType.StoredProcedure;
                    //cmd1.CommandText = "PR_LOC_State_SelectForDropDownByCountryID";
                    //cmd1.Parameters.AddWithValue("@CountryID", modelLOC_City.CountryID);
                    //DataTable dt1 = new DataTable();
                    //SqlDataReader objSDR1 = cmd1.ExecuteReader();
                    //dt1.Load(objSDR1);

                    DataTable dtDropdownState = dalLOC.PR_LOC_State_SelectByDropdownList(modelLOC_City.CountryID);

                    List<Areas.Models.LOC_StateDropDownModel> listState1 = new List<Areas.Models.LOC_StateDropDownModel>();
                    foreach (DataRow dr in dtDropdownState.Rows)
                    {
                        Areas.Models.LOC_StateDropDownModel vl = new Areas.Models.LOC_StateDropDownModel();
                        vl.StateID = (Convert.ToInt32(dr["StateID"]));
                        vl.StateName = (Convert.ToString(dr["StateName"]));
                        listState1.Add(vl);
                    }
                    ViewBag.StateList = listState1;

                    return View("LOC_CityAddEdit", modelLOC_City);
                }
            }
            return View("LOC_CityAddEdit");
        }

        // POST: LOC_CityController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: LOC_CityController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: LOC_CityController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: LOC_CityController/Delete/5
        public ActionResult Delete(int CityId)
        {
            if (Convert.ToBoolean(cityDAL.PR_LOC_City_Delete(CityId)))
                return RedirectToAction("Admin");
            return View("Admin");
        }
    }
}
