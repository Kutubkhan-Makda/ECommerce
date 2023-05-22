using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ECommerce.DAL;
using System.Data;
using ECommerce.Auth;

namespace ECommerce.Areas.Users.Controllers
{
    [Area("Users")]
    [Route("Users/[Controller]/[action]")]
    public class UsersController : Controller
    {
        UserDAL userDAL = new UserDAL();
        // GET: UsersController
        public ActionResult Index()
        {
            return RedirectToAction("Home","Admin");
        }

        public ActionResult Users()
        {
            return RedirectToAction("Index","Home");
        }

        [CheckAdminAccess]
        public ActionResult Admin()
        {
            DataTable dtUsers = userDAL.PR_User_SelectAll();
            return View("UsersListAdmin",dtUsers);
        }

        [CheckUsersAccess]
        public ActionResult Profile()
        {
            DataTable dtUsers = userDAL.PR_User_SelectbyPK(@CV.UserId());
            return View("ProfileUsers",dtUsers); 
        }

        [CheckAdminAccess]
        public ActionResult ProfileAdmin(int UserId)
        {
            DataTable dtUsers = userDAL.PR_User_SelectbyPK(UserId);
            return View("ProfileAdmin",dtUsers); 
        }

        [CheckAdminAccess]
        public ActionResult Delete(int UserId)
        {
            if (Convert.ToBoolean(userDAL.PR_User_DeleteByPK(UserId)))
                return RedirectToAction("Admin");
            return View("Admin");
        }

        public IActionResult Add(int? UserId)
        {
            //DataTable dtDropdownCountry = categoryDAL.PR_Category_SelectAll();
//
            //List<Areas.Category.Models.CategoryDropdown> listCategory = new List<Areas.Category.Models.CategoryDropdown>();
            //foreach (DataRow dr in dtDropdownCategory.Rows)
            //{
            //    Areas.Category.Models.CategoryDropdown vl = new Areas.Category.Models.CategoryDropdown();
            //    vl.CategoryId = (Convert.ToInt32(dr["CategoryId"]));
            //    vl.CategoryName = (Convert.ToString(dr["CategoryName"]));
            //    listCategory.Add(vl);
            //}
            //ViewBag.CategoryList = listCategory;
//
            //DataTable dtDropdownManufacturer = manufacturerDAL.PR_Manufacturer_SelectAll();
//
            //List<Areas.Manufacturer.Models.ManufacturerDropdown> listManufacturer = new List<Areas.Manufacturer.Models.ManufacturerDropdown>();
            //foreach (DataRow dr in dtDropdownManufacturer.Rows)
            //{
            //    Areas.Manufacturer.Models.ManufacturerDropdown vl = new Areas.Manufacturer.Models.ManufacturerDropdown();
            //    vl.ManufacturerId= (Convert.ToInt32(dr["ManufacturerId"]));
            //    vl.ManufacturerName = (Convert.ToString(dr["ManufacturerName"]));
            //    listManufacturer.Add(vl);
            //}
            //ViewBag.ManufacturerList = listManufacturer;

            if (UserId != null)
            {
                DataTable dt = userDAL.PR_User_SelectbyPK(UserId);
                if(dt.Rows.Count > 0)
                {
                    Areas.Users.Models.Users usersModel = new Areas.Users.Models.Users();
                    foreach (DataRow dr in dt.Rows)
                    {
                        usersModel.UserId = (Convert.ToInt32(CV.UserId));
                        usersModel.UserName = (Convert.ToString(CV.UserName));
                        usersModel.Password = (Convert.ToString(CV.Password));
                        usersModel.CountryId = (Convert.ToInt32(CV.CountryId));
                        usersModel.Email = (Convert.ToString(CV.Email));
                        usersModel.RoleType = (Convert.ToString(CV.RoleType));
                        usersModel.Address = (Convert.ToString(CV.Address));
                        usersModel.ImageUrl = (Convert.ToString(CV.ImageUrl));
                    }

                    return View("", usersModel);
                } 
            }
            return View("");
        }

        public IActionResult Update(Areas.Users.Models.Users modelUser)
        {
            if (modelUser.File != null)
            {
                string FilePath = "wwwroot\\UsersImages";
                string path = Path.Combine(Directory.GetCurrentDirectory(), FilePath);

                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);

                string fileNameWithPath = Path.Combine(path, modelUser.File.FileName);
                modelUser.ImageUrl = "" + FilePath.Replace("wwwroot\\", "/") + "/" + modelUser.File.FileName;

                using (var stream = new FileStream(fileNameWithPath, FileMode.Create))
                {
                    modelUser.File.CopyTo(stream);
                }

            }
             
            if(Convert.ToBoolean(userDAL.PR_User_Update(modelUser.UserId,modelUser.UserName,modelUser.Email,modelUser.Password,modelUser.Address,modelUser.ImageUrl)))
            {
                if(modelUser.UserId == null)
                {
                    TempData["ContactInsertMsg"] = "Record Inserted Successfully";
                }
                else
                {
                    TempData["ContactInsertMsg"] = "Record Updated Successfully";
                }
            }
            
            return RedirectToAction("Index");
        }

        public IActionResult Register(Areas.Users.Models.Users modelUser)
        {
            if(Convert.ToBoolean(userDAL.PR_User_Register(modelUser.UserName,modelUser.Email,modelUser.Password)))
            {
                if(modelUser.UserId == null)
                {
                    TempData["ContactInsertMsg"] = "Record Inserted Successfully";
                }
                else
                {
                    TempData["ContactInsertMsg"] = "Record Updated Successfully";
                }
            }
            
            return RedirectToAction("Users");
        }

        [HttpPost]
        public IActionResult Login(Areas.Users.Models.Users modelUser)
        {
            String error = null;

            if(modelUser.Email == null )
            {
                error  += "User Email is Required";
            }
            if(modelUser.Password == null )
            {
                error  += "<br/>Password is Required";
            }

            if(error != null)
            {
                TempData["Error"] = error;
                return RedirectToAction("Index");
            }
            else{
                DataTable dt = userDAL.PR_User_SelectByIDPass(modelUser.Email,modelUser.Password);
                if(dt.Rows.Count > 0)
                {
                    foreach(DataRow dr in dt.Rows)
                    {
                        HttpContext.Session.SetInt32("UserId",Convert.ToInt32(dr["UserId"]));
                        HttpContext.Session.SetString("Email",dr["Email"].ToString());
                        HttpContext.Session.SetString("UserName",dr["UserName"].ToString());
                        HttpContext.Session.SetString("Address",dr["Address"].ToString());
                        HttpContext.Session.SetString("Password",dr["Password"].ToString());
                        HttpContext.Session.SetString("RoleType",dr["RoleType"].ToString());
                        HttpContext.Session.SetString("ImageUrl",dr["ImageUrl"].ToString());
                        break;
                    }
                }
                else
                {
                    TempData["Error"] = "User Name and Password is Incorect";
                    return RedirectToAction("Index");
                }
                if(HttpContext.Session.GetString("Email") != null && HttpContext.Session.GetString("Password") != null)
                {
                    return RedirectToAction("Home","Admin");
                }
            }
            return RedirectToAction("Index");
        }

        public IActionResult LoginUser(Areas.Users.Models.Users modelUser)
        {
            String error = null;

            if(modelUser.Email == null )
            {
                error  += "User Email is Required";
            }
            if(modelUser.Password == null )
            {
                error  += "<br/>Password is Required";
            }

            if(error != null)
            {
                TempData["Error"] = error;
                return RedirectToAction("Users");
            }
            else{
                DataTable dt = userDAL.PR_User_SelectByIDPass(modelUser.Email,modelUser.Password);
                if(dt.Rows.Count > 0)
                {
                    foreach(DataRow dr in dt.Rows)
                    {
                        HttpContext.Session.SetInt32("UserId",Convert.ToInt32(dr["UserId"]));
                        HttpContext.Session.SetString("Email",dr["Email"].ToString());
                        HttpContext.Session.SetString("UserName",dr["UserName"].ToString());
                        HttpContext.Session.SetString("Address",dr["Address"].ToString());
                        HttpContext.Session.SetString("Password",dr["Password"].ToString());
                        HttpContext.Session.SetString("RoleType",dr["RoleType"].ToString());
                        HttpContext.Session.SetString("ImageUrl",dr["ImageUrl"].ToString());
                        break;
                    }
                }
                else
                {
                    TempData["Error"] = "User Name and Password is Incorect";
                    return RedirectToAction("Users");
                }
                if(HttpContext.Session.GetString("Email") != null && HttpContext.Session.GetString("Password") != null)
                {
                    return RedirectToAction("Index","Home");
                }
            }
            return RedirectToAction("Users");
        }

        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index","Admin");
        }

        public IActionResult LogoutUser()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index","Home");
        }
    }
}
