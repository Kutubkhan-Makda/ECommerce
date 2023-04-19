using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ECommerce.Auth;

namespace ECommerce.Areas.Manufacturer.Controllers
{
    [Area("Category")]
    [Route("Category/[Controller]/[action]")]
    //[CheckAdminAccess]
    public class ManufacturerController : Controller
    {
        // GET: ManufacturerController
        public ActionResult Index()
        {
            return View();
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
