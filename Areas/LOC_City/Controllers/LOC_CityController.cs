using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ECommerce.DAL;
using System.Data;
using ECommerce.Auth;

namespace ECommerce.Areas.LOC_City.Controllers
{
    [Area("LOC_City")]
    [Route("LOC_City/[Controller]/[action]")]
    [CheckAdminAccess]
    public class LOC_CityController : Controller
    {
        LOC_CityDAL cityDAL = new LOC_CityDAL();
        // GET: LOC_CityController
        public ActionResult Admin()
        {
            DataTable dtCity = lOC_CityDAL.PR_LOC_City_SelectAll();
            return View("CityList",dtCity);
        }

        // GET: LOC_CityController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: LOC_CityController/Create
        public ActionResult Create()
        {
            return View();
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
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: LOC_CityController/Delete/5
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
