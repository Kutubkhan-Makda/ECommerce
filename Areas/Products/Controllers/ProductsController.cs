using ECommerce.DAL;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using ECommerce.Areas.Products.Models;
using ECommerce.Auth;
namespace ECommerce.Areas.Products.Controllers
{
    [Area("Products")]
    [Route("Products/[Controller]/[action]")]
    //[CheckAdminAccess]
    public class ProductsController : Controller
    {
        ProductsDAL productsDAL = new ProductsDAL();
        CategoryDAL categoryDAL = new CategoryDAL();
        ManufacturerDAL manufacturerDAL = new ManufacturerDAL();
        // GET: ProductsController
        public ActionResult Index()
        {
            DataTable dtProduct = productsDAL.PR_Product_SelectAll();
            return View("ProductsList",dtProduct);
        }

        public ActionResult Admin()
        {
            DataTable dtProduct = productsDAL.PR_Product_SelectAll();
            return View("ProductsListAdmin",dtProduct);
        }

        public IActionResult Add(int? ProductId)
         {
            DataTable dtDropdownCategory = categoryDAL.PR_Category_SelectAll();

            List<Areas.Category.Models.CategoryDropdown> listCategory = new List<Areas.Category.Models.CategoryDropdown>();
            foreach (DataRow dr in dtDropdownCategory.Rows)
            {
                Areas.Category.Models.CategoryDropdown vl = new Areas.Category.Models.CategoryDropdown();
                vl.CategoryId = (Convert.ToInt32(dr["CategoryId"]));
                vl.CategoryName = (Convert.ToString(dr["CategoryName"]));
                listCategory.Add(vl);
            }
            ViewBag.CategoryList = listCategory;

            DataTable dtDropdownManufacturer = manufacturerDAL.PR_Manufacturer_SelectAll();

            List<Areas.Manufacturer.Models.ManufacturerDropdown> listManufacturer = new List<Areas.Manufacturer.Models.ManufacturerDropdown>();
            foreach (DataRow dr in dtDropdownManufacturer.Rows)
            {
                Areas.Manufacturer.Models.ManufacturerDropdown vl = new Areas.Manufacturer.Models.ManufacturerDropdown();
                vl.ManufacturerId= (Convert.ToInt32(dr["ManufacturerId"]));
                vl.ManufacturerName = (Convert.ToString(dr["ManufacturerName"]));
                listManufacturer.Add(vl);
            }
            ViewBag.ManufacturerList = listManufacturer;

            if (ProductId != null)
            {
                DataTable dt = productsDAL.PR_Product_SelectbyPK(ProductId);
                if(dt.Rows.Count > 0)
                {
                    Areas.Products.Models.Products productsModel = new Areas.Products.Models.Products();
                    foreach (DataRow dr in dt.Rows)
                    {
                        productsModel.CategoryId = (Convert.ToInt32(dr["CategoryId"]));
                        productsModel.Name = (Convert.ToString(dr["Name"]));
                        productsModel.ManufacturerId = (Convert.ToInt32(dr["ManufacturerId"]));
                        productsModel.Description = (Convert.ToString(dr["Description"]));
                        productsModel.Price = (Convert.ToDecimal(dr["Price"]));
                        productsModel.Discount = (Convert.ToDecimal(dr["Discount"]));
                        productsModel.Quantity = (Convert.ToInt32(dr["Quantity"]));
                        productsModel.ImageUrl = (Convert.ToString(dr["ImageUrl"]));
                    }

                    return View("ProductsAddEdit", productsModel);
                } 
            }
            return View("ProductsAddEdit");
        }

        public IActionResult Save(Areas.Products.Models.Products modelProducts)
        {
            if (modelProducts.ImageUrl != null)
            {
                string FilePath = "wwwroot\\Admin\assets\aproduct";
                string path = Path.Combine(Directory.GetCurrentDirectory(), FilePath);

                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);

                string fileNameWithPath = Path.Combine(path, modelProducts.File.FileName);
                modelProducts.ImageUrl = "" + FilePath.Replace("wwwroot\\", "/") + "/" + modelProducts.File.FileName;

                using (var stream = new FileStream(fileNameWithPath, FileMode.Create))

                {
                    modelProducts.File.CopyTo(stream);
                }

            }
             
            if(Convert.ToBoolean(productsDAL.PR_Product_Save(modelProducts.ProductId,modelProducts.CategoryId,modelProducts.Name,modelProducts.ManufacturerId,modelProducts.Description,modelProducts.Price,modelProducts.Discount,modelProducts.Quantity,modelProducts.ImageUrl)))
            {
                if(modelProducts.ProductId == null)
                {
                    TempData["ProductInsertMsg"] = "Record Inserted Successfully";
                }
                else
                {
                    TempData["ProductInsertMsg"] = "Record Updated Successfully";
                }
            }
            
            return RedirectToAction("Admin");
        }

        // GET: ProductsController/Delete/5
        public ActionResult Delete(int ProductId)
        {
            if (Convert.ToBoolean(productsDAL.PR_Product_Delete(ProductId)))
                return RedirectToAction("Admin");
            return View("Admin");
        }
    }
}
