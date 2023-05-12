using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SelectPdf;

namespace ECommerce.Areas.Orders.Controllers
{
    [Area("Orders")]
    [Route("Orders/[Controller]/[action]")]
    public class OrdersController : Controller
    {
        // GET: OrdersController
        public ActionResult Index()
        {
            return View("BillPDF");
        }

        public ActionResult Admin()
        {
            return View("Bill2");
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

        // GET: OrdersController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: OrdersController/Create
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

        // GET: OrdersController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
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
