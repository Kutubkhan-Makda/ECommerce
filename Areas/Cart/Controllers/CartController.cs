using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ECommerce.DAL;
using ECommerce.Auth;
using System.Data;

namespace ECommerce.Areas.Cart.Controllers
{
    [Area("Cart")]
    [Route("Cart/[Controller]/[action]")]
    public class CartController : Controller
    {
        CartDAL cartDAL = new CartDAL();
        // GET: CartController
        [CheckUsersAccess]
        public ActionResult Index()
        {
            DataTable dtCart = cartDAL.PR_Cart_SelectbyUser(@CV.UserId());
            return View("Cart",dtCart);
        }

        [CheckAdminAccess]
        public ActionResult Admin(int UserId)
        {
            DataTable dtCart = cartDAL.PR_Cart_SelectbyUser(UserId);
            return View("CartAdmin",dtCart);
        }

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
        [CheckUsersAccess]
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
        [CheckUsersAccess]
        public ActionResult Delete(int CartId)
        {
            if (Convert.ToBoolean(cartDAL.PR_Cart_Delete(CartId)))
                return RedirectToAction("Index");
            return View("Index");
        }
    }
}
