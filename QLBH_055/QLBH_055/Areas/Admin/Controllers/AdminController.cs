using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLBH_055.Models;

namespace QLBH_055.Areas.Admin.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin/Admin
        QLBHEntities db = new QLBHEntities();
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection f)
        {
            string Email = f["EMAIL"].ToString();
            string Passwork = f["MATKHAU"].ToString();
            try
            {
                var Admin = db.ADMINs.SingleOrDefault(n => n.EMAIL == Email && n.MATKHAU == Passwork);
                if (Admin != null && Admin.TRANGTHAI == true)
                {
                    Session["ADMIN"] = Admin.MAAD;
                    Session["TENAD"] = Admin.TENAD;
                    return RedirectToAction("TrangChu", "Admin");
                }
            }
            catch (Exception e)
            {

            }
            return View();
        }
        public ActionResult TrangChu()
        {
            if (Session["ADMIN"] == null)
            {
                return RedirectToAction("DangNhap", "Admin");
            }
            else
            {
                ViewBag.NameAD = Session["TENAD"].ToString();
            }

            return View();
        }
        public int CountHoa()
        {
            int DemHoa = db.SANPHAMs.Count();
            return DemHoa;
        }
        public int Counttintuc()
        {
            int Demtt = db.TINTUCs.Count();
            return Demtt;
        }
        public int CountKH()
        {
            int DemKH = db.KHACHHANGs.Count();
            return DemKH;
        }
        public int CountDT()
        {
            int DemhD = db.HOADONs.Count();
            HOADON h = new HOADON();
            if(DemhD != 0){
                ViewBag.Total = int.Parse(db.HOADONs.Sum(x => x.DONGIA).ToString());
            }
            else
            {
                ViewBag.Total = 0;
            }

            return ViewBag.Total;
        }
        public PartialViewResult HeaderADPartial()
        {
            return PartialView();
        }
        public string GetQC(int ThuTuQC)
        {
            var qc = db.QUANGCAOs.SingleOrDefault(n => n.THUTUQC == ThuTuQC && n.TRANGTHAI == true);
            string Anh = "";
            Anh += qc.ANHQC.ToString();
            return Anh;
        }
        public ActionResult DangXuat()
        {
            Session["ADMIN"] = null;
            Session["TENAD"] = null;
            return RedirectToAction("DangNhap", "Admin");
        }
    }
}