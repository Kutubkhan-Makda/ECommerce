using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SelectPdf;
using ECommerce.DAL;
using ECommerce.Auth;
using System.Data;

namespace ECommerce.Areas.Orders.Controllers
{
    [Area("Orders")]
    [Route("Orders/[Controller]/[action]")]
    public class OrdersController : Controller
    {
        OrdersDAL ordersDAL = new OrdersDAL();
        CartDAL cartDAL = new CartDAL();
        // GET: OrdersController
        public ActionResult Index()
        {
            return View("BillPDF");
        }

        public ActionResult Admin()
        {
            return View("Bill2");
        }

        public ActionResult OrderItemAdd()
        {
            DataTable dtCart = cartDAL.PR_Cart_SelectbyUser(@CV.UserId());
            return View("OrderItemAdd",dtCart);
        }

        // GET: OrdersController/Details/5
        public ActionResult BillPDF(string html)
        {
            html = html.Replace("StrTag", "<").Replace("EndTag", ">");

            HtmlToPdf htmlToPDF = new HtmlToPdf();
            htmlToPDF.Options.PdfPageSize = PdfPageSize.A4;
            htmlToPDF.Options.MarginTop = 10;
            htmlToPDF.Options.MarginBottom = 10;
            htmlToPDF.Options.MarginLeft = 10;
            htmlToPDF.Options.MarginRight = 10;
            PdfDocument pdfDocument = htmlToPDF.ConvertHtmlString(html);
            byte[] pdf = pdfDocument.Save();
            pdfDocument.Close();

            return File(pdf,"application/pdf","Bill.pdf");
        }

        public IActionResult Orders_Insert(Areas.Orders.Models.Orders ordersModel)
        { 
            if(Convert.ToBoolean(ordersDAL.PR_Orders_Insert(ordersModel.OrderId,ordersModel.ShippingAddress)))
            {
                if(ordersModel.OrderId == null)
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

        // POST: OrdersController/Edit/5
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

        // GET: OrdersController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: OrdersController/Delete/5
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
