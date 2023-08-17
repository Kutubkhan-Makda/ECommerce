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
            DataTable dtDropdownCountry = CountryDAL.PR_LOC_Country_SelectAll();
            
            List<Areas.LOC_Country.Models.LOC_Country> countryDropdownlist = new List<Areas.LOC_Country.Models.LOC_Country>();
            foreach(DataRow dr in dtDropdownCountry.Rows)
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

                    return View("StateAddEdit", modelLOC_State);
                } 
            }
            return View("StateAddEdit");
        }

        // POST: LOC_StateController/Create
        [HttpPost]
        public IActionResult Save(Areas.LOC_State.Models.LOC_State modelLoc_State)
        {
            if(Convert.ToBoolean(stateDAL.PR_LOC_Save_State(modelLoc_State.StateId,modelLoc_State.CountryId,modelLoc_State.StateName,modelLoc_State.StateCode)))
            {
                if(modelLoc_State.StateId == null)
                {
                    TempData["StateInsetMsg"] = "Record Inserted Successfully";
                }
                else
                {
                    TempData["StateInsetMsg"] = "Record Updated Successfully";
                }
            }
            
            return RedirectToAction("Index");
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
