using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ECommerce.DAL;
using System.Data;
using ECommerce.Auth;

namespace ECommerce.Areas.LOC_State.Controllers
{
    [Area("LOC_State")]
    [Route("LOC_State/[Controller]/[action]")]
    //[CheckAdminAccess]
    public class LOC_StateController : Controller
    {
        LOC_StateDAL stateDAL = new LOC_StateDAL();

        LOC_CountryDAL CountryDAL = new LOC_CountryDAL();
        // GET: LOC_StateController
        public ActionResult Admin()
        {
            DataTable dtState = stateDAL.PR_LOC_State_SelectAll();
            return View("StateList",dtState);
        }

        public IActionResult Add(int? StateId)
        {
            DataTable dtCountry = CountryDAL.PR_LOC_Country_SelectAll();
            
            List<Areas.LOC_Country.Models.LOC_Country> countryDropdownlist = new List<Areas.LOC_Country.Models.LOC_Country>();
            foreach(DataRow dr in dtCountry.Rows)
            {
                Areas.LOC_Country.Models.LOC_Country modelLOC_CountryDropDown = new Areas.LOC_Country.Models.LOC_Country();
                modelLOC_CountryDropDown.CountryId = (Convert.ToInt32(dr["CountryId"]));
                modelLOC_CountryDropDown.CountryName = (Convert.ToString(dr["CountryName"]));
                countryDropdownlist.Add(modelLOC_CountryDropDown);
            }
            ViewBag.CountryList = countryDropdownlist;

            if (StateId != null)
            {
                DataTable dtState = stateDAL.PR_LOC_State_SelectByPK(StateId);
                if(dtState.Rows.Count > 0)
                {
                    Areas.LOC_State.Models.LOC_State modelLOC_State = new Areas.LOC_State.Models.LOC_State();
                    foreach (DataRow dr in dtState.Rows)
                    {
                        modelLOC_State.StateId = (Convert.ToInt32(dr["StateId"]));
                        modelLOC_State.StateName = (Convert.ToString(dr["StateName"]));
                        modelLOC_State.StateCode = (Convert.ToString(dr["StateCode"]));
                        modelLOC_State.CountryId = (Convert.ToInt32(dr["CountryId"]));
                    }

                    return View("LOC_StateAddEdit", modelLOC_State);
                } 
            }
            return View("LOC_StateAddEdit");
        }

        // POST: LOC_StateController/Create
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

        // GET: LOC_StateController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: LOC_StateController/Edit/5
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

        // GET: LOC_StateController/Delete/5
        public ActionResult Delete(int StateId)
        {
            if (Convert.ToBoolean(stateDAL.PR_LOC_State_Delete(StateId)))
                return RedirectToAction("Admin");
            return View("Admin");
        }
    }
}
