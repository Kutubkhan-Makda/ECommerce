using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ECommerce.DAL;
using System.Data;
using ECommerce.Auth;

namespace ECommerce.Areas.LOC_State.Controllers
{
    [Area("LOC_State")]
    [Route("LOC_State/[Controller]/[action]")]
    //[CheckAdminAccess]
    public class LOC_StateController : Controller
    {
        LOC_StateDAL stateDAL = new LOC_StateDAL();

        LOC_CountryDAL lOC_CountryDAL = new LOC_CountryDAL();
        // GET: LOC_StateController
        public ActionResult Admin()
        {
            DataTable dtState = stateDAL.PR_LOC_State_SelectAll();
            return View("StateList",dtState);
        }

        public IActionResult Add(int? StateID)
        {
            DataTable dtState = lOC_CountryDAL.PR_LOC_Country_SelectAll();
            
            List<Areas.LOC_Country.Models.LOC_Country> countryDropdownlist = new List<Areas.LOC_Country.Models.LOC_Country>();
            foreach(DataRow dr in dtState.Rows)
            {
                Areas.LOC_Country.Models.LOC_Country modelLOC_CountryDropDown = new Areas.LOC_Country.Models.LOC_Country();
                modelLOC_CountryDropDown.CountryId = (Convert.ToInt32(dr["CountryId"]));
                modelLOC_CountryDropDown.CountryName = (Convert.ToString(dr["CountryName"]));
                countryDropdownlist.Add(modelLOC_CountryDropDown);
            }
            ViewBag.CountryList = countryDropdownlist;

            if (StateID != null)
            {
                //String str = this.Configuration.GetConnectionString("SQL_AddressBook");
                //SqlConnection conn = new SqlConnection(str);
                //conn.Open();
                //SqlCommand cmd = conn.CreateCommand();
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.CommandText = "PR_LOC_State_SelectByPK";
                //cmd.Parameters.Add("@StateID", SqlDbType.Int).Value = StateID;
                DataTable dt = dalLOC.PR_LOC_State_SelectByPK(StateID);
                //SqlDataReader objSDR = cmd.ExecuteReader();
                //dt.Load(objSDR);
                if(dt.Rows.Count > 0)
                {
                    LOC_StateModel modelLOC_State = new LOC_StateModel();
                    foreach (DataRow dr in dt.Rows)
                    {
                        modelLOC_State.StateID = (Convert.ToInt32(dr["StateID"]));
                        modelLOC_State.StateName = (Convert.ToString(dr["StateName"]));
                        modelLOC_State.StateCode = (Convert.ToString(dr["StateCode"]));
                        modelLOC_State.CreationDate = (Convert.ToDateTime(dr["CreationDate"]));
                        modelLOC_State.ModificationDate = (Convert.ToDateTime(dr["ModificationDate"]));
                        modelLOC_State.CountryID = (Convert.ToInt32(dr["CountryID"]));
                    }

                    return View("LOC_StateAddEdit", modelLOC_State);
                } 
            }
            return View("LOC_StateAddEdit");
        }

        // POST: LOC_StateController/Create
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

        // GET: LOC_StateController/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: LOC_StateController/Edit/5
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

        // GET: LOC_StateController/Delete/5
        public ActionResult Delete(int StateId)
        {
            if (Convert.ToBoolean(stateDAL.PR_LOC_State_Delete(StateId)))
                return RedirectToAction("Admin");
            return View("Admin");
        }
    }
}
