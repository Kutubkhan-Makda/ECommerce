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

        LOC_StateDAL stateDAL = new LOC_StateDAL();

        LOC_CountryDAL countryDAL = new LOC_CountryDAL();
        // GET: LOC_CityController
        public ActionResult Admin()
        {
            DataTable dtCity = cityDAL.PR_LOC_City_SelectAll();
            return View("CityList",dtCity);
        }

        public IActionResult Add(int? CityID)
        {
            DataTable dtDropdownCountry = countryDAL.PR_LOC_Country_SelectAll();
            
            List<Areas.LOC_Country.Models.LOC_Country> countryDropdownlist = new List<Areas.LOC_Country.Models.LOC_Country>();
            foreach(DataRow dr in dtDropdownCountry.Rows)
            {
                Areas.LOC_Country.Models.LOC_Country modelLOC_CountryDropDown = new Areas.LOC_Country.Models.LOC_Country();
                modelLOC_CountryDropDown.CountryId = (Convert.ToInt32(dr["CountryId"]));
                modelLOC_CountryDropDown.CountryName = (Convert.ToString(dr["CountryName"]));
                countryDropdownlist.Add(modelLOC_CountryDropDown);
            }
            ViewBag.CountryList = countryDropdownlist;

            List<Areas.LOC_State.Models.LOC_State> stateDropdownlist = new List<Areas.LOC_State.Models.LOC_State>();
            ViewBag.StateList = stateDropdownlist;

            if (CityID != null)
            {
                DataTable dt = cityDAL.PR_LOC_City_SelectByPK(CityID);

                if (dt.Rows.Count > 0)
                {
                    Areas.LOC_City.Models.LOC_City modelLOC_City = new Areas.LOC_City.Models.LOC_City();
                    foreach (DataRow dr in dt.Rows)
                    {
                        modelLOC_City.CityId = (Convert.ToInt32(dr["CityId"]));
                        modelLOC_City.CityName = (Convert.ToString(dr["CityName"]));
                        modelLOC_City.CityCode = (Convert.ToString(dr["CityCode"]));
                        modelLOC_City.StateId = (Convert.ToInt32(dr["StateID"]));
                        modelLOC_City.CountryId = (Convert.ToInt32(dr["CountryID"]));
                    }

                    DataTable dtDropdownState = stateDAL.PR_LOC_State_SelectByDropdownList(modelLOC_City.CountryId);

                    List<Areas.LOC_State.Models.LOC_State> listState = new List<Areas.LOC_State.Models.LOC_State>();
                    foreach (DataRow dr in dtDropdownState.Rows)
                    {
                        Areas.LOC_State.Models.LOC_State modelLOC_StateDropDown = new Areas.LOC_State.Models.LOC_State();
                        modelLOC_StateDropDown.StateId = (Convert.ToInt32(dr["StateId"]));
                        modelLOC_StateDropDown.StateName = (Convert.ToString(dr["StateName"]));
                        listState.Add(modelLOC_StateDropDown);
                    }
                    ViewBag.StateList = listState;

                    return View("CityAddEdit", modelLOC_City);
                }
            }
            return View("CityAddEdit");
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
