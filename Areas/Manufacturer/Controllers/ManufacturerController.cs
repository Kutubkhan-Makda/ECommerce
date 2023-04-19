using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using ECommerce.Auth;
using ECommerce.DAL;

namespace ECommerce.Areas.Manufacturer.Controllers
{
    [Area("Manufacturer")]
    [Route("Manufacturer/[Controller]/[action]")]
    //[CheckAdminAccess]
    public class ManufacturerController : Controller
    {
        ManufacturerDAL manufacturerDAL = new ManufacturerDAL();
        // GET: ManufacturerController
        public ActionResult Admin()
        {
            DataTable dtManufacturer = manufacturerDAL.PR_Manufacturer_SelectAll();
            return View("ManufacturerListAdmin",dtManufacturer);
        }

        // GET: ManufacturerController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: ManufacturerController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ManufacturerController/Create
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

        // GET: ManufacturerController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: ManufacturerController/Edit/5
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

        // GET: ManufacturerController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: ManufacturerController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
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
    }
}
