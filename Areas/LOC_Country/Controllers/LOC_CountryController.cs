using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ECommerce.DAL;
using System.Data;
using ECommerce.Auth;

namespace ECommerce.Areas.LOC_Country.Controllers
{
    [Area("LOC_Country")]
    [Route("LOC_Country/[Controller]/[action]")]
    [CheckAdminAccess]
    public class LOC_CountryController : Controller
    {
        LOC_CountryDAL countryDAL = new LOC_CountryDAL();
        // GET: LOC_CountryController
        public ActionResult Admin()
        {
            DataTable dtCity = countryDAL.PR_LOC_Country_SelectAll();
            return View("CityList",dtCity);
        }

        // GET: LOC_CountryController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: LOC_CountryController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: LOC_CountryController/Create
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

        // GET: LOC_CountryController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: LOC_CountryController/Edit/5
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

        // GET: LOC_CountryController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: LOC_CountryController/Delete/5
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
