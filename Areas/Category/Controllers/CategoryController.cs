using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ECommerce.DAL;
using System.Data;
using ECommerce.Auth;

namespace ECommerce.Areas.Category.Controllers
{
    [Area("Category")]
    [Route("Category/[Controller]/[action]")]
    //[CheckAdminAccess]
    public class CategoryController : Controller
    {
        CategoryDAL categoryDAL = new CategoryDAL();
        // GET: CategoryController
        public ActionResult Admin()
        {
            DataTable dtCategory = categoryDAL.PR_Category_SelectAll();
            return View("CategoryListAdmin",dtCategory);
        }

        public IActionResult Add(int? CategoryId)
        {
            if (CategoryId != null)
            {
                DataTable dt = categoryDAL.PR_Category_SelectbyPK(CategoryId);
                if(dt.Rows.Count > 0)
                {
                    Areas.Category.Models.Category categoryModel = new Areas.Category.Models.Category();
                    foreach (DataRow dr in dt.Rows)
                    {
                        categoryModel.CategoryId = (Convert.ToInt32(dr["CategoryId"]));
                        categoryModel.CategoryName = (Convert.ToString(dr["CategoryName"]));
                    }

                    return View("CategoryAddEdit", categoryModel);
                } 
            }
            return View("CategoryAddEdit");
        }

        public IActionResult Save(Areas.Category.Models.Category categoryModel)
        { 
            if(Convert.ToBoolean(categoryDAL.PR_Category_Save(categoryModel.CategoryId,categoryModel.CategoryName)))
            {
                if(categoryModel.CategoryId == null)
                {
                    TempData["ContactInsertMsg"] = "Record Inserted Successfully";
                }
                else
                {
                    TempData["ContactInsertMsg"] = "Record Updated Successfully";
                }
            }
            
            return RedirectToAction("Admin");
        }

        public ActionResult Delete(int CategoryId)
        {
            if (Convert.ToBoolean(categoryDAL.PR_Category_Delete(CategoryId)))
                return RedirectToAction("Admin");
            return View("Admin");
        }
    }
}
