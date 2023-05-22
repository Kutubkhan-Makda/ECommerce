using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ECommerce.Areas.LOC_City.Controllers
{
    public class LOC_CityController : Controller
    {
        // GET: LOC_CityController
        public ActionResult Index()
        {
            return View();
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
