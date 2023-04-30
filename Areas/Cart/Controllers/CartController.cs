using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ECommerce.DAL;
using ECommerce.Auth;
using System.Data;

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
            DataTable dtCart = cartDAL.PR_Cart_SelectbyUser();
            return View("Cart",dtCart);
        }

        public ActionResult Admin()
        {
            DataTable dtCart = cartDAL.PR_Cart_SelectbyUser();
            return View("Cart",dtCart);
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
            if(Convert.ToBoolean(cartDAL.PR_Cart_InsertItem(cartModel.ProductId,cartModel.Quantity,cartModel.Price)))
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
        public ActionResult Delete(int CartId)
        {
            if (Convert.ToBoolean(cartDAL.PR_Cart_Delete(CartId)))
                return RedirectToAction("Index");
            return View("Index");
        }
    }
}
