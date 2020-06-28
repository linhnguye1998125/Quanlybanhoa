using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLBH_055.Models;

namespace QLBH_055.Controllers
{
    public class FooterController : Controller
    {

        // GET: Footer
        static SendEmail s = new SendEmail();
        QLBHEntities db = new QLBHEntities();
        public PartialViewResult FooterPartial()
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
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult kkk(string email)
        {
            s.sendEmail("", email, "");
            return Redirect("~/");
        }
     
    }
}