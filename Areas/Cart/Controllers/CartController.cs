using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ECommerce.DAL;
using ECommerce.Auth;

namespace ECommerce.Areas.Cart.Controllers
{
    [Area("Cart")]
    [Route("Cart/[Controller]/[action]")]
    [CheckUsersAccess]
    public class CartController : Controller
    {
        CartDAL cartDAL = new CartDAL();
        // GET: CartController
        public ActionResult Index()
        {
            return View("Cart");
        }

        // GET: CartController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: CartController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: CartController/Create
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

        // GET: CartController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: CartController/Edit/5
        public IActionResult Insert(Areas.Cart.Models.Cart cartModel)
        { 
            if(Convert.ToBoolean(cartDAL.PR_Cart_InsertItem(cartModel.ProductId,cartModel.Quantity,cartModel.TotalPrice)))
            {
                if(cartModel.CartId == null)
                {
                    TempData["CategoryInsertMsg"] = "Record Inserted Successfully";
                }
                else
                {
                    TempData["CategoryInsertMsg"] = "Record Updated Successfully";
                }
            }
            
            return RedirectToAction("Index");
        }

        // GET: CartController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: CartController/Delete/5
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
