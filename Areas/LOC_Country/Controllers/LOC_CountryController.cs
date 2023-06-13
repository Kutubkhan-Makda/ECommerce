using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ECommerce.DAL;
using System.Data;
using ECommerce.Auth;

namespace ECommerce.Areas.LOC_Country.Controllers
{
    [Area("LOC_Country")]
    [Route("LOC_Country/[Controller]/[action]")]
    //[CheckAdminAccess]
    public class LOC_CountryController : Controller
    {
        LOC_CountryDAL countryDAL = new LOC_CountryDAL();
        // GET: LOC_CountryController
        public ActionResult Admin()
        {
            DataTable dtCountry = countryDAL.PR_LOC_Country_SelectAll();
            return View("CountryList",dtCountry);
        }

        // POST: LOC_CountryController/Create
        [HttpPost]
        public IActionResult Add(int? CountryId)
        {
            if (CountryId != null)
            {
                DataTable dt = countryDAL.(CountryId);

                LOC_CountryModel modelLOC_Country = new LOC_CountryModel();
                foreach (DataRow dr in dt.Rows)
                {
                    modelLOC_Country.CountryID = (Convert.ToInt32(dr["CountryID"]));
                    modelLOC_Country.CountryName = (Convert.ToString (dr["CountryName"]));
                    modelLOC_Country.CountryCode = (Convert.ToString (dr["CountryCode"]));
                    modelLOC_Country.CreationDate = (Convert.ToDateTime(dr["CreationDate"]));
                    modelLOC_Country.ModificationDate = (Convert.ToDateTime(dr["ModificationDate"]));
                }
                return View("LOC_CountryAddEdit", modelLOC_Country);
            }
            return View("LOC_CountryAddEdit");
        }

        [HttpPost]
        public IActionResult Save(LOC_CountryModel modelLoc_Country)
        {
            LOC_DAL dalLOC = new LOC_DAL();
             
            if(Convert.ToBoolean(dalLOC.PR_LOC_Save_Country(modelLoc_Country.CountryID,modelLoc_Country.CountryName,modelLoc_Country.CountryCode)))
            {
                if(modelLoc_Country.CountryID == null)
                {
                    TempData["CountryInsetMsg"] = "Record Inserted Successfully";
                }
                else
                {
                    TempData["CountryInsetMsg"] = "Record Updated Successfully";
                }
            }
            
            return RedirectToAction("Index");
        }

        // GET: LOC_CountryController/Delete/5
        public ActionResult Delete(int CountryId)
        {
            if (Convert.ToBoolean(countryDAL.PR_LOC_Country_Delete(CountryId)))
                return RedirectToAction("Admin");
            return View("Admin");
        }
    }
}
