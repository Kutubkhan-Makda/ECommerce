using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ECommerce.DAL;
using ECommerce.Auth;
using System.Data;
namespace ECommerce.Areas.OrderItems.Controllers
{
    [Area("OrderItems")]
    [Route("OrderItems/[Controller]/[action]")]
    public class OrderItemsController : Controller
    {
        OrdersDAL ordersDAL = new OrdersDAL();
        // GET: OrderItemsController
        public ActionResult Index()
        {
            return View();
        }

        // GET: OrderItemsController/Details/5
        public IActionResult OrdersItem_Insert(Areas.OrderItems.Models.OrderItems orderItemsModel)
        { 
            if(Convert.ToBoolean(ordersDAL.PR_OrdersItem_Insert(orderItemsModel.OrderId,orderItemsModel.ProductId,orderItemsModel.Quantity,orderItemsModel.Price)))
            {
                if(orderItemsModel.OrderItemId == null)
                {
                    TempData["CategoryInsertMsg"] = "Record Inserted Successfully";
                }
                else
                {
                    TempData["CategoryInsertMsg"] = "Record Updated Successfully";
                }
            }
            
            return RedirectToAction("OrderItemAdd");
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
