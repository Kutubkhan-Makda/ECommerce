﻿using Microsoft.AspNetCore.Http;
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
        public IActionResult Add(int? CountryId)
        {
            if (CountryId != null)
            {
                DataTable dtCountry = countryDAL.PR_LOC_Country_SelectByPK(CountryId);
                if(dtCountry.Rows.Count > 0)
                {
                    Areas.LOC_Country.Models.LOC_Country modelLOC_Country = new Areas.LOC_Country.Models.LOC_Country();
                    foreach (DataRow dr in dtCountry.Rows)
                    {
                        modelLOC_Country.CountryId = (Convert.ToInt32(dr["CountryId"]));
                        modelLOC_Country.CountryName = (Convert.ToString (dr["CountryName"]));
                        modelLOC_Country.CountryCode = (Convert.ToString (dr["CountryCode"]));
                    }
                    return View("CountryAddEdit", modelLOC_Country);
                }
            }
            return View("CountryAddEdit");
        }

        [HttpPost]
        public IActionResult Save(Areas.LOC_Country.Models.LOC_Country  modelLOC_Country)
        {    
            if(Convert.ToBoolean(countryDAL.PR_LOC_Save_Country(modelLOC_Country.CountryId,modelLOC_Country.CountryName,modelLOC_Country.CountryCode)))
            {
                if(modelLOC_Country.CountryId == null)
                {
                    TempData["CountryInsetMsg"] = "Record Inserted Successfully";
                }
                else
                {
                    TempData["CountryInsetMsg"] = "Record Updated Successfully";
                }
            }
            
            return RedirectToAction("Admin");
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
