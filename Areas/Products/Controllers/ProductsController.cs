using ECommerce.DAL;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace ECommerce.Areas.Products.Controllers
{
    [Area("Products")]
    [Route("Products/[Controller]/[action]")]
    public class ProductsController : Controller
    {
        ProductsDAL ProductsDAL = new ProductsDAL();
        // GET: ProductsController
        public ActionResult Index()
        {
            DataTable dtProduct = ProductsDAL.PR_Product_SelectAll();
            return View("ProductsList",dtProduct);
        }

        public IActionResult Add(int? ProductId)
         {
            //DataTable dt1 = ProductsDAL.PR_LOC_Country_SelectByDropdownList();
            //
            //List<Areas.Models.LOC_CountryDropDownModel> list=new List<Areas.Models.LOC_CountryDropDownModel>();
            //foreach(DataRow dr in dt1.Rows)
            //{
            //    Areas.Models.LOC_CountryDropDownModel modelLOC_CountryDropDown = new Areas.Models.LOC_CountryDropDownModel();
            //    modelLOC_CountryDropDown.CountryID = (Convert.ToInt32(dr["CountryID"]));
            //    modelLOC_CountryDropDown.CountryName = (Convert.ToString(dr["CountryName"]));
            //    list.Add(modelLOC_CountryDropDown);
            //}
            //ViewBag.CountryList=list;
            if (ProductId != null)
            {
                //String str = this.Configuration.GetConnectionString("SQL_AddressBook");
                //SqlConnection conn = new SqlConnection(str);
                //conn.Open();
                //SqlCommand cmd = conn.CreateCommand();
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.CommandText = "PR_LOC_State_SelectByPK";
                //cmd.Parameters.Add("@StateID", SqlDbType.Int).Value = StateID;
                DataTable dt = ProductsDAL.PR_Product_SelectbyPK(ProductId);
                //SqlDataReader objSDR = cmd.ExecuteReader();
                //dt.Load(objSDR);
                if(dt.Rows.Count > 0)
                {
                    Products productsModel = new Products();
                    foreach (DataRow dr in dt.Rows)
                    {
                        productsModel.StateID = (Convert.ToInt32(dr["StateID"]));
                        productsModel.StateName = (Convert.ToString(dr["StateName"]));
                        productsModel.StateCode = (Convert.ToString(dr["StateCode"]));
                        productsModel.CreationDate = (Convert.ToDateTime(dr["CreationDate"]));
                        productsModel.ModificationDate = (Convert.ToDateTime(dr["ModificationDate"]));
                        productsModel.CountryID = (Convert.ToInt32(dr["CountryID"]));
                    }

                    return View("ProductsAddEdit", productsModel);
                } 
            }
            return View("ProductsAddEdit");
        }

        // GET: ProductsController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: ProductsController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ProductsController/Create
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

        // GET: ProductsController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: ProductsController/Edit/5
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

        // GET: ProductsController/Delete/5
        public ActionResult Delete(int ProductId)
        {
            if (Convert.ToBoolean(ProductsDAL.PR_Product_Delete(ProductId)))
                return RedirectToAction("Index");
            return View("Index");
        }

        // POST: ProductsController/Delete/5
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
