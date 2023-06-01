using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ECommerce.DAL;
using System.Data;
using ECommerce.Auth;

namespace ECommerce.Areas.LOC_State.Controllers
{
    [Area("LOC_Country")]
    [Route("LOC_Country/[Controller]/[action]")]
    [CheckAdminAccess]
    public class LOC_StateController : Controller
    {
        // GET: LOC_StateController
        public ActionResult Index()
        {
            DataTable dtCountry = countryDAL.PR_LOC_Country_SelectAll();
            return View("CountryList",dtCountry);
        }

        // GET: LOC_StateController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: LOC_StateController/Create
        public ActionResult Create()
        {
            return View();
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
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: LOC_StateController/Delete/5
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
