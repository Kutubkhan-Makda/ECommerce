using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using ECommerce.Areas.Products.Models;
using ECommerce.Auth;
using ECommerce.DAL;

namespace ECommerce.Areas.Sales.Controllers
{
    [CheckAdminAccess]
    [Area("Sales")]
    [Route("Sales/[Controller]/[action]")]
    public class SalesController : Controller
    {
        SalesDAL salesDAL = new SalesDAL();

        public ActionResult Admin()
        {
            DataTable dtSales = salesDAL.PR_Sales_SelectAll();
            return View("SalesListAdmin",dtSales);
        }

        [HttpPost]
        public IActionResult Save(Areas.Sales.Models.Sales modelSales)
        { 
            if(Convert.ToBoolean(salesDAL.PR_Sales_Insert(modelSales.ProductId,modelSales.Discount)))
            {
                if(modelSales.SalesId == null)
                {
                    TempData["ProductInsertMsg"] = "Record Inserted Successfully";
                }
                else
                {
                    TempData["ProductInsertMsg"] = "Record Updated Successfully";
                }
            }
            
            return RedirectToAction("Admin");
        }

        public ActionResult Delete(int SalesId)
        {
            if (Convert.ToBoolean(salesDAL.PR_Sales_Delete(SalesId)))
                return RedirectToAction("Admin");
            return View("Admin");
        }
    }
}
