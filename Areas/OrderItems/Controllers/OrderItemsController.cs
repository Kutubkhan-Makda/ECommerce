using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ECommerce.Areas.OrderItems.Controllers
{
    public class OrderItemsController : Controller
    {
        // GET: OrderItemsController
        public ActionResult Index()
        {
            return View();
        }

        // GET: OrderItemsController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: OrderItemsController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: OrderItemsController/Create
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

        // GET: OrderItemsController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: OrderItemsController/Edit/5
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

        // GET: OrderItemsController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: OrderItemsController/Delete/5
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
