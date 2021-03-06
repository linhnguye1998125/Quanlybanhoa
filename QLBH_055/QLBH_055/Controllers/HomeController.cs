﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLBH_055.Models;
using System.Web.Script.Serialization;
using System.Web.UI.WebControls;
using PagedList;
using PagedList.Mvc;
using System.Data.SqlClient;
using System.Globalization;
using System.Threading.Tasks;
using System.Data.Entity.Validation;

namespace QLBH_055.Controllers
{
    public class HomeController : Controller
    {
        static SendEmail s = new SendEmail();
        QLBHEntities db = new QLBHEntities();
        public static int masp = 1;
        private static int SLSanPham = 4;
        public ActionResult Index()
        {
            return Redirect("~/Trang-Chu");
        }

        public ActionResult TrangChu()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult TrangChu(string ten, string email)
        {
            s.sendEmail(ten, email, "");
            return View();
        }
        //Trang giới thiệu
        public ActionResult GioiThieu()
        {
            return View();
        }
        public ActionResult Chinhsach()
        {
            return View();
        }

        // Trang Liên Hệ
        public ActionResult LienHe()
        {

            return View();
        }
        public ActionResult Huongdanthanhtoan()
        {

            return View();
        }
        public ActionResult Ynghahoa()
        {

            return View();
        }
        public ActionResult Hoatuchon()
        {
            //string str = "1001,1003,1005"; //query database and get the selected value

            //List<string> selectedList = str.Split(',').ToList();

            ////DDLGetInitData() method get the DropDownList Init data
            ////according to the selected value to set the default selected value.
            //List<SelectListItem> ddlitemlist = db.SANPHAMs.ToList().Select(c => new SelectListItem { Text = c.TENSP, Value = c.TENSP.ToString(), Selected = selectedList.Contains(c.MASP.ToString()) ? true : false }).ToList();

            //ViewBag.ddlitemlist = ddlitemlist; //using ViewBag to bind DropDownList
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Hoatuchon(string ten, string email, string noidung, string loaihoa, string sl, string[] DDLTest)
        {
            try
            {
                string hoa = string.Join(",", DDLTest); //result like this: 1002,1004
                s.sendEmailgiohangtchon(ten, email, noidung, loaihoa, sl, hoa);
            }
            catch(Exception e)
            {

            }
            return View();
        }
     
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LienHe(string ten, string email, string noidung)
        {
            s.sendEmail(ten, email, noidung);
            return View();
        }


        public ActionResult DiaChi()
        {
            return View();
        }


        public PartialViewResult NoiDungSanPhamPartial(int? page, int MADM = 1, int? LocGia = 0)
        {
            int pageSize = 9;
            int pageNumber = (page ?? 1);
            var sanPham = db.SANPHAMs.Where(m => m.MADM == MADM).ToList().ToPagedList(pageNumber, pageSize);
            DANHMUC danhMuc = db.DANHMUCs.SingleOrDefault(m => m.MADM == MADM);
            if (LocGia != 0)
            {
                switch (LocGia)
                {
                    case 1:
                        sanPham = db.SANPHAMs.Where(m => m.MADM == MADM && m.GIASP < 100000).ToList().OrderBy(m => m.GIASP).ToPagedList(pageNumber, pageSize);
                        break;
                    case 2:
                        sanPham = db.SANPHAMs.Where(m => m.MADM == MADM && m.GIASP >= 100000 && m.GIASP < 200000).ToList().OrderBy(m => m.GIASP).ToPagedList(pageNumber, pageSize);
                        break;
                    case 3:
                        sanPham = db.SANPHAMs.Where(m => m.MADM == MADM && m.GIASP >= 200000 && m.GIASP < 300000).ToList().OrderBy(m => m.GIASP).ToPagedList(pageNumber, pageSize);
                        break;
                    case 4:
                        sanPham = db.SANPHAMs.Where(m => m.MADM == MADM && m.GIASP >= 300000 && m.GIASP < 400000).ToList().OrderBy(m => m.GIASP).ToPagedList(pageNumber, pageSize);
                        break;
                    case 5:
                        sanPham = db.SANPHAMs.Where(m => m.MADM == MADM && m.GIASP >= 400000).ToList().OrderBy(m => m.GIASP).ToPagedList(pageNumber, pageSize);
                        break;
                }
            }
            if (sanPham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MADM = MADM;
            ViewBag.MAGIA = LocGia;
            ViewBag.TENDM = danhMuc.TENDM.ToString();
            return PartialView(sanPham);
        }
        public ActionResult SanPham()
        {
            var DanhMuc = db.DANHMUCs.ToList();
            ViewBag.DanhMuc = DanhMuc;
            return View();
        }

        //public ActionResult SanPham(int? page,int MADM = 1, int? LocGia = 0)
        //{
        //    int pageSize = 9;
        //    int pageNumber = (page ?? 1);
        //    var SanPham = db.SANPHAMs.Where(m => m.MADM == MADM).ToList().ToPagedList(pageNumber,pageSize);
        //    DANHMUC dm = db.DANHMUCs.SingleOrDefault(m => m.MADM == MADM);
        //    if (LocGia != 0) {
        //        switch (LocGia)
        //        {
        //            case 1:
        //                SanPham = db.SANPHAMs.Where(m => m.GIASP < 100000).ToList().ToPagedList(pageNumber, pageSize);
        //                break;
        //            case 2:
        //                break;
        //        }
        //    }
        //    var DanhMuc = db.DANHMUCs.ToList();
        //    if (SanPham == null)
        //    {
        //        Response.StatusCode = 404;
        //        return null;
        //    }
        //    ViewBag.MADM = MADM;
        //    ViewBag.TENDM = dm.TENDM.ToString();
        //    ViewBag.DanhMuc = DanhMuc;
        //    return View(SanPham);
        //}
        public ActionResult kkk()
        {

            return View();
        }

        public JsonResult gettensp()
        {

            var name = db.SANPHAMs.OrderBy(p => p.TENSP).Select(p => p.TENSP).ToList();

            //   var tensp = new SendEmail().getlistname();
            return Json(new { data = name }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult TimKiem(string txttimkiem)
        {
            var SanPham = db.SANPHAMs.SqlQuery("select * from SANPHAM Where TENSP like '%' + @timkiem + '%'", new SqlParameter("timkiem", txttimkiem)).ToList();
            return View(SanPham);
        }

        public PartialViewResult DanhMucPartial()
        {
            var DanhMuc = db.DANHMUCs.Where(n => n.TRANGTHAI == true).ToList();
            return PartialView(DanhMuc);
        }

        public PartialViewResult ContentPartial(int MADM = 1, Boolean XEMTHEM = false)
        {

            if (XEMTHEM)
            {
                SLSanPham += 12;
                var SanPhamXemThem = db.SANPHAMs.Where(m => m.MADM == MADM).Take(SLSanPham).ToList();
                if (SanPhamXemThem == null)
                {
                    Response.StatusCode = 404;
                    return null;
                }
                ViewBag.SanPham = SanPhamXemThem;
                return PartialView();
            }
            SLSanPham = 12;
            var SanPham = db.SANPHAMs.Where(m => m.MADM == MADM).Take(SLSanPham).ToList();
            if (SanPham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MADM = MADM;
            ViewBag.SanPham = SanPham;
            return PartialView();
        }
        public string TrangThai(int sl)
        {
            string trangthai = "Còn hàng";
            if (sl <= 0)
            {
                trangthai = "Hết hàng";
            }
            return trangthai;
        }
        public ActionResult ChiTietSanPham(int MASP = 0)
        {
            var SanPham = db.SANPHAMs.SingleOrDefault(m => m.MASP == MASP);
            if (SanPham == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            SanPham.LUOTXEM = SanPham.LUOTXEM + 1;
            UpdateModel(SanPham);
            db.SaveChanges();
            masp = SanPham.MASP;
            return View(SanPham);
        }

        public string FormatPrice(string _strInput)
        {
            string strInput = _strInput;
            int Length = 0;
            if (strInput.IndexOf('.') > 0)
                Length = strInput.Length - (strInput.Length - strInput.IndexOf('.'));
            else
                Length = strInput.Length;
            string afterFormat = "";
            if (Length <= 3)
                afterFormat = strInput;
            else if (Length > 3)
            {
                afterFormat = strInput.Insert(Length - 3, ".");
                Length = afterFormat.IndexOf(".");
                while (Length > 3)
                {
                    afterFormat = afterFormat.Insert(Length - 3, ".");
                    Length = Length - 3;
                }
            }
            return afterFormat;
        }
        // Giỏ hàng partial
        public PartialViewResult GioHangPartial()
        {
            var cart = Session["GioHang"];
            var list = new List<GioHang>();
            if (cart != null)
            {
                list = (List<GioHang>)cart;
            }
            return PartialView(list);
        }

        // Giỏ hàng khởi tạo
        public ActionResult GioHang()
        {
            //var cart = Session["GioHang"];
            //var list = new List<GioHang>();
            //if (cart != null)
            //{
            //    list = (List<GioHang>)cart;
            //}
            //return View(list);
            return View();
        }
        //thêm vào giỏ hàng 
        public ActionResult AddItem(int soluong = 1)
        {
            int MASP = masp;
            if (Session["GioHang"] == null) // Nếu giỏ hàng chưa được khởi tạo
            {
                Session["GioHang"] = new List<GioHang>();  // Khởi tạo Session["giohang"] là 1 List<GioHang>
            }
            List<GioHang> giohang = Session["GioHang"] as List<GioHang>;  // Gán qua biến giohang dễ code

            // Kiểm tra xem sản phẩm khách đang chọn đã có trong giỏ hàng chưa
            if (giohang.FirstOrDefault(m => m.MASP == MASP) == null) // ko co sp nay trong gio hang
            {
                SANPHAM sp = db.SANPHAMs.Find(MASP);
                // tim sp theo MaHoa
                GioHang sanpham = new GioHang()
                {
                    MASP = MASP,
                    TENSP = sp.TENSP,
                    ANHSP = sp.ANHSP,
                    SoLuong = soluong,
                    GIASP = Decimal.Parse(sp.GIASP.ToString())

                };  // Tạo ra 1 sản phẩm mới

                giohang.Add(sanpham);  // Thêm sản phẩm vào giỏ 
            }
            else
            {
                // Nếu sản phẩm khách chọn đã có trong giỏ hàng thì không thêm vào giỏ nữa mà tăng số lượng lên.
                GioHang sanpham = giohang.FirstOrDefault(m => m.MASP == MASP);
                sanpham.SoLuong++;
            }
            return RedirectToAction("GioHang");
        }


        public JsonResult AddGioHang(int MASP)
        {
            //int MASP = masp;
            if (Session["GioHang"] == null) // Nếu giỏ hàng chưa được khởi tạo
            {
                Session["GioHang"] = new List<GioHang>();  // Khởi tạo Session["giohang"] là 1 List<GioHang>
            }
            List<GioHang> giohang = Session["GioHang"] as List<GioHang>;  // Gán qua biến giohang dễ code

            // Kiểm tra xem sản phẩm khách đang chọn đã có trong giỏ hàng chưa
            if (giohang.FirstOrDefault(m => m.MASP == MASP) == null) // ko co sp nay trong gio hang
            {
                SANPHAM sp = db.SANPHAMs.Find(MASP);
                // tim sp theo MaHoa
                GioHang sanpham = new GioHang()
                {
                    MASP = MASP,
                    TENSP = sp.TENSP,
                    ANHSP = sp.ANHSP,
                    SoLuong = 1,
                    GIASP = Decimal.Parse(sp.GIASP.ToString())

                };  // Tạo ra 1 sản phẩm mới

                giohang.Add(sanpham);  // Thêm sản phẩm vào giỏ 
            }
            else
            {
                // Nếu sản phẩm khách chọn đã có trong giỏ hàng thì không thêm vào giỏ nữa mà tăng số lượng lên.
                GioHang sanpham = giohang.FirstOrDefault(m => m.MASP == MASP);
                sanpham.SoLuong++;
            }
            return Json(new
            {
                status = true
            });
        }
        //Xóa giỏ hàng
        public JsonResult Delete(int MASP)
        {
            var GioHang = (List<GioHang>)Session["GioHang"];
            GioHang.RemoveAll(k => k.MASP == MASP);
            return Json(new
            {
                status = true
            });
        }
        //Cập nhật số lượng giỏ hàng
        public JsonResult Update(string CartModel)
        {
            var GioHang = new JavaScriptSerializer().Deserialize<List<GioHang>>(CartModel);
            var session = (List<GioHang>)Session["GioHang"];

            foreach (var item in session)
            {
                var jsonItem = GioHang.SingleOrDefault(n => n.MASP == item.MASP);
                if (jsonItem != null)
                {
                    item.SoLuong = jsonItem.SoLuong;
                }
            }
            return Json(new
            {
                status = true
            });
        }
        //Trang Tin Tức 
        public ActionResult TinTuc(int? page)
        {
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            var ListTinTuc = db.TINTUCs.ToList().OrderBy(n => n.NGAYDANG).ToPagedList(pageNumber, pageSize);
            var DanhMuc = db.DANHMUCs.Where(n => n.TRANGTHAI == true).ToList();
            ViewBag.DanhMuc = DanhMuc;
            return View(ListTinTuc);
        }

        public PartialViewResult ChiTietTinTucPartial(int MATT)
        {
            var CTTinTuc = db.TINTUCs.SingleOrDefault(n => n.MATT == MATT);
            CTTinTuc.LUOTXEM = CTTinTuc.LUOTXEM + 1;
            UpdateModel(CTTinTuc);
            db.SaveChanges();
            return PartialView(CTTinTuc);
        }

        // Tin Tức Partial
        public PartialViewResult TinTucPartial()
        {
            var TinTuc = db.TINTUCs.Where(m => m.NOIBAT == 1).ToList();
            return PartialView(TinTuc);
        }

        public PartialViewResult ThanhToanPartial()
        {
            int MaKH = int.Parse(Session["MAKH"].ToString());
            string mail = Session["EMAIL"].ToString();
            var KhachHang = db.KHACHHANGs.SingleOrDefault(n => n.MAKH == MaKH);
            List<HTThanhToanItem> listHTThanhToan = new List<HTThanhToanItem>();
            listHTThanhToan.Add(new HTThanhToanItem(1, "Thanh toán trước khi giao hàng"));
            listHTThanhToan.Add(new HTThanhToanItem(2, "Thanh toán Paypal"));
            listHTThanhToan.Add(new HTThanhToanItem(3, "Thanh toán sau khi nhận hàng"));
            listHTThanhToan.Add(new HTThanhToanItem(4, "Thanh toán bằng MOMO"));
            List<HThucGiaoHang> listHTGiaoHang = new List<HThucGiaoHang>();
            listHTGiaoHang.Add(new HThucGiaoHang(1, "Giao trực tiếp tại cửa hàng"));
            listHTGiaoHang.Add(new HThucGiaoHang(2, "Chuyển giao"));
            SelectList HTTT = new SelectList(listHTThanhToan, "Name", "Name");
            SelectList HTGH = new SelectList(listHTGiaoHang, "NameGH", "NameGH");

            ViewBag.HTTT = HTTT;
            ViewBag.HTGH = HTGH;

            return PartialView(KhachHang);
        }
        [HttpGet]
        public ActionResult ThanhToan()
        {
            var cart = Session["GioHang"];
            var list = new List<GioHang>();
            if (cart != null)
            {
                list = (List<GioHang>)cart;
            }
            try
            {

            }
            catch (Exception ex)
            {
                ex.GetBaseException();
            }
            return View(list);
        }

        [HttpPost]
        public ActionResult ThanhToan(FormCollection kh, DateTime ngaygiao, string ghichu)
        {
            try
            {
           
                string mail = Session["EMAIL"].ToString();
                var donhang = new HOADON();
                donhang.MAKH = int.Parse(Session["MAKH"].ToString());
                donhang.TENKH = kh["HOTEN"].ToString();
                donhang.DIENTHOAI = kh["DIENTHOAI"].ToString();
                donhang.DIACHI = kh["DIACHI"].ToString();
                donhang.NGAYDAT = DateTime.Now.Date;
                donhang.NGAYGIAO = ngaygiao;
                donhang.HTTHANHTOAN = kh["Id"].ToString();
                donhang.HTGIAOHANG = kh["MaGH"].ToString();
                donhang.DONGIA = TongTien();

                var MaKH = them(donhang);
                var GioHang = (List<GioHang>)Session["GioHang"];
                foreach (var item in GioHang)
                {
                    try
                    {
                        var CTHOADON = new CTHOADON();

                        CTHOADON.MAHD = donhang.MAHD;
                        CTHOADON.MASP = item.MASP;
                        CTHOADON.TENSP = item.TENSP.ToString();
                        CTHOADON.SOLUONG = item.SoLuong;
                        CTHOADON.DONGIA = item.GIASP;
                        CTHOADON.THANHTIEN = item.ThanhTien;
                        db.CTHOADONs.Add(CTHOADON);
                        db.SaveChanges();
                        s.autosendEmail(mail, CTHOADON.MAHD, ghichu);
                    }
                    catch (DbEntityValidationException e)
                    {
                        foreach (var eve in e.EntityValidationErrors)
                        {
                            Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                                eve.Entry.Entity.GetType().Name, eve.Entry.State);
                            foreach (var ve in eve.ValidationErrors)
                            {
                                Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                                    ve.PropertyName, ve.ErrorMessage);
                            }
                        }
                        throw;
                    }
                }

            }
            catch (DbEntityValidationException e)
            {
                foreach (var eve in e.EntityValidationErrors)
                {
                    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }
                throw;
            }
            Session["GioHang"] = null;
            return Redirect("~/Trang-Chu");
        }

        public decimal TongTien()
        {
            var ListGioHang = (List<GioHang>)Session["GioHang"];
            decimal Tong = 0;
            foreach (var item in ListGioHang)
            {
                Tong += item.ThanhTien;
            }
            return Tong;
        }
        public long them(HOADON hoadon)
        {
            db.HOADONs.Add(hoadon);
            db.SaveChanges();
            return int.Parse(hoadon.MAKH.ToString());
        }

    }
}