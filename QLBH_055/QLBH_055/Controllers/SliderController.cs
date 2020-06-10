using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLBH_055.Models;
namespace QLBH_055.Controllers
{
    public class SliderController : Controller
    {
        // GET: Slider
        QLBHEntities db = new QLBHEntities();
        public PartialViewResult SliderPartial()
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
    }
}