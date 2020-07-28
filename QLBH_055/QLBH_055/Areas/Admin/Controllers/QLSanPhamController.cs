using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using OfficeOpenXml;
using PagedList;
using PagedList.Mvc;
using QLBH_055.Models;
namespace QLBH_055.Areas.Admin.Controllers
{
    public class QLSanPhamController : Controller
    {
        // GET: Admin/QLSanPham
        QLBHEntities db = new QLBHEntities();
        public static int LuuMASP;
        public ActionResult SanPham(int? page)
        {
            if (Session["ADMIN"] == null)
            {
                return RedirectToAction("DangNhap", "Admin");
            }
            else
            {
                ViewBag.NameAD = Session["TENAD"].ToString();
            }
            // tạo biến số sản phẩm trên một trang
            int pageSize = 10;
            // Số trang của sản phẩm
            int pageNumber = (page ?? 1);
            var SanPham = db.SANPHAMs.ToList().OrderBy(n => n.MASP).ToPagedList(pageNumber, pageSize);
            return View(SanPham);
        }
        public ActionResult ThemPartial()
        {
            return View();
        }

        // Action thêm sản phẩm
        public ActionResult ThemSanPham(FormCollection f, SANPHAM SanPham)
        {
            try
            {
                string TenSP = f["TENSP"].ToString();
                string AnhSP = f["file"].ToString();
                string XuatSu = f["XUATSU"].ToString();
                string MoTa = f["MOTA"].ToString();
                int GIASP = int.Parse(f["GIASP"].ToString());
                int GIAMGIA = int.Parse(f["GIAMGIA"].ToString());
                short SPMOI = short.Parse(f["SPMOI"].ToString());
                int MADM = int.Parse(f["MADM"].ToString());
                int LUOTXEM = int.Parse(f["LUOTXEM"].ToString());
                int SOLUONG = int.Parse(f["SOLUONG"].ToString());
                SanPham.TENSP = TenSP;
                SanPham.ANHSP = AnhSP;
                SanPham.XUATSU = XuatSu;
                SanPham.MOTA = MoTa;
                SanPham.GIASP = GIASP;
                SanPham.GIAMGIA = GIAMGIA;
                SanPham.SPMOI = SPMOI;
                SanPham.MADM = MADM;
                SanPham.LUOTXEM = LUOTXEM;
                SanPham.SOLUONG = SOLUONG;
                db.SANPHAMs.Add(SanPham);
                db.SaveChanges();
            }
            catch (Exception)
            {

            }
            return RedirectToAction("SanPham", "QLSanPham");
        }
        // Action Xóa sản phẩm
        public ActionResult Xoa(int MASP)
        {
            var IndexSanPham = db.SANPHAMs.SingleOrDefault(n => n.MASP == MASP);
            db.SANPHAMs.Remove(IndexSanPham);
            db.SaveChanges();
            return Json(new
            {
                status = true
            }, JsonRequestBehavior.AllowGet);
        }

        // Public Sửa Sản Phẩm
        public PartialViewResult SuaPartial(int MASP)
        {
            var SanPham = db.SANPHAMs.SingleOrDefault(n => n.MASP == MASP);
            LuuMASP = MASP;
            return PartialView(SanPham);
        }
        public ActionResult SuaSanPham(FormCollection f)
        {
            try
            {
                string TenSP = f["TENSP"].ToString();
                string AnhSP = f["file"].ToString();
                string XuatSu = f["XUATSU"].ToString();
                string MoTa = f["MOTA"].ToString();
                int GIASP = int.Parse(f["GIASP"].ToString());
                int GIAMGIA = int.Parse(f["GIAMGIA"].ToString());
                short SPMOI = short.Parse(f["SPMOI"].ToString());
                int MADM = int.Parse(f["MADM"].ToString());
                int LUOTXEM = int.Parse(f["LUOTXEM"].ToString());
                int SOLUONG = int.Parse(f["SOLUONG"].ToString());
                var SanPham = db.SANPHAMs.SingleOrDefault(n => n.MASP == LuuMASP);
                SanPham.TENSP = TenSP;
                SanPham.ANHSP = AnhSP;
                SanPham.XUATSU = XuatSu;
                SanPham.MOTA = MoTa;
                SanPham.GIASP = GIASP;
                SanPham.GIAMGIA = GIAMGIA;
                SanPham.SPMOI = SPMOI;
                SanPham.MADM = MADM;
                SanPham.LUOTXEM = LUOTXEM;
                SanPham.SOLUONG = SOLUONG;
                UpdateModel(SanPham);
                db.SaveChanges();
            }
            catch (Exception)
            {

            }
            return RedirectToAction("SanPham", "QLSanPham");
        }


        public ActionResult Upload(FormCollection formCollection)
        {
            try
            {
                var usersList = new List<SANPHAM>();
                if (Request != null)
                {
                    HttpPostedFileBase file = Request.Files["UploadedFile"];
                    if ((file != null) && (file.ContentLength > 0) && !string.IsNullOrEmpty(file.FileName))
                    {
                        string fileName = file.FileName;
                        string fileContentType = file.ContentType;
                        byte[] fileBytes = new byte[file.ContentLength];
                        var data = file.InputStream.Read(fileBytes, 0, Convert.ToInt32(file.ContentLength));
                        using (var package = new ExcelPackage(file.InputStream))
                        {
                            var currentSheet = package.Workbook.Worksheets;
                            var workSheet = currentSheet.First();
                            //var workSheet = currentSheet["asdasdasd"];
                            var noOfCol = workSheet.Dimension.End.Column;
                            var noOfRow = workSheet.Dimension.End.Row;
                            for (int rowIterator = 3; rowIterator <= noOfRow; rowIterator++)
                            {
                                var user = new SANPHAM();
                                //user.university_code = workSheet.Cells[rowIterator, 6].Value.ToString();
                                user.TENSP = Convert.ToString(workSheet.Cells[rowIterator, 1].Value);
                                user.ANHSP = Convert.ToString(workSheet.Cells[rowIterator, 2].Value);
                                user.XUATSU = Convert.ToString(workSheet.Cells[rowIterator, 3].Value);
                                user.MOTA = Convert.ToString(workSheet.Cells[rowIterator, 4].Value);
                                user.GIASP = Convert.ToDecimal(workSheet.Cells[rowIterator, 5].Value);
                                user.GIAMGIA = Convert.ToDecimal(workSheet.Cells[rowIterator, 6].Value);
                                user.SPMOI = Convert.ToInt16(workSheet.Cells[rowIterator, 7].Value);
                                user.MADM = Convert.ToInt32(workSheet.Cells[rowIterator, 8].Value);
                                user.LUOTXEM = Convert.ToInt32(workSheet.Cells[rowIterator, 9].Value);
                                user.SOLUONG = Convert.ToInt32(workSheet.Cells[rowIterator, 10].Value);

                                //user.level_university = Convert.ToInt32(workSheet.Cells[rowIterator, 9].Value);
                                //user.hot_key = workSheet.Cells[rowIterator, 7].Value.ToString();
                                //user.SNo = .ToInt32(workSheet.Cells[rowIterator, 1].Value);
                                //user.Name = workSheet.Cells[rowIterator,3 ].Value.ToString();
                                //user.Age = Convert.ToInt32(workSheet.Cells[rowIterator, 5].Value);
                                usersList.Add(user);
                            }
                        }
                    }
                }
                using (QLBHEntities excelImportDBEntities = new QLBHEntities())
                {
                    foreach (var item in usersList)
                    {
                        excelImportDBEntities.SANPHAMs.Add(item);
                    }
                    excelImportDBEntities.SaveChanges();
                }
            }
            catch (Exception e)
            {
                e.GetBaseException();
            }
            return RedirectToAction("SanPham");
        }
    }
}