using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using ECommerce.Auth;
using ECommerce.DAL;

namespace ECommerce.Areas.Manufacturer.Controllers
{
    [Area("Manufacturer")]
    [Route("Manufacturer/[Controller]/[action]")]
    [CheckAdminAccess]
    public class ManufacturerController : Controller
    {
        ManufacturerDAL manufacturerDAL = new ManufacturerDAL();
        // GET: ManufacturerController
        public ActionResult Admin()
        {
            DataTable dtManufacturer = manufacturerDAL.PR_Manufacturer_SelectAll();
            return View("ManufacturerListAdmin",dtManufacturer);
        }

        public IActionResult Add(int? ManufacturerId)
        {
            if (ManufacturerId != null)
            {
                DataTable dt = manufacturerDAL.PR_Manufacturer_SelectbyPK(ManufacturerId);
                if(dt.Rows.Count > 0)
                {
                    Areas.Manufacturer.Models.Manufacturer ManufacturerModel = new Areas.Manufacturer.Models.Manufacturer();
                    foreach (DataRow dr in dt.Rows)
                    {
                        ManufacturerModel.ManufacturerId = (Convert.ToInt32(dr["ManufacturerId"]));
                        ManufacturerModel.ManufacturerName = (Convert.ToString(dr["ManufacturerName"]));
                    }

                    return View("ManufacturerAddEdit", ManufacturerModel);
                } 
            }
            return View("ManufacturerAddEdit");
        }

        public IActionResult Save(Areas.Manufacturer.Models.Manufacturer ManufacturerModel)
        { 
            if(Convert.ToBoolean(manufacturerDAL.PR_Manufacturer_Save(ManufacturerModel.ManufacturerId,ManufacturerModel.ManufacturerName)))
            {
                if(ManufacturerModel.ManufacturerId == null)
                {
                    TempData["ManufacturerInsertMsg"] = "Record Inserted Successfully";
                }
                else
                {
                    TempData["ManufacturerInsertMsg"] = "Record Updated Successfully";
                }
            }
            
            return RedirectToAction("Admin");
        }

        public ActionResult Delete(int ManufacturerId)
        {
            if (Convert.ToBoolean(manufacturerDAL.PR_Manufacturer_Delete(ManufacturerId)))
                return RedirectToAction("Admin");
            return View("Admin");
        }
    }
}
