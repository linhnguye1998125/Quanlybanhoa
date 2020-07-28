using OfficeOpenXml;
using OfficeOpenXml.Style;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLBH_055.Models;
using System.Web.UI.WebControls;
using System.Text;
using System.Web.UI;

namespace QLBH_055.Areas.Admin.Controllers
{
    public class QLThongKeController : Controller
    {
        QLBHEntities db = new QLBHEntities();
        public ActionResult ThongKe()
        {
            if (Session["ADMIN"] == null)
            {
                return RedirectToAction("DangNhap", "Admin");
            }
            else
            {
                ViewBag.NameAD = Session["TENAD"].ToString();
            }
            List<int> ItemMonth = new List<int>();
            for (int i = 1; i < 13; i++)
            {
                ItemMonth.Add(i);
            }
            List<int> ItemYear = new List<int>();
            for (int i = 2019; i <= 2030; i++)
            {
                ItemYear.Add(i);
            }
            SelectList itemMonth = new SelectList(ItemMonth);
            SelectList itemYear = new SelectList(ItemYear);
            // Set vào ViewBag
            ViewBag.ItemMonth = itemMonth;
            ViewBag.ItemYear = itemYear;
            return View();
        }
        public PartialViewResult DSThongKePartial(int IdMonth = 5, int IdYear = 2019)
        {
            // SELECT* FROM KHACHHANG WHERE MONTH(NGAYSINH) = 2 AND YEAR(NGAYSINH)= 2000
            var DSThongKeThang = db.HOADONs.Where(n => n.NGAYDAT.Value.Month == IdMonth && n.NGAYDAT.Value.Year == IdYear).ToList();
            ViewBag.DS = DSThongKeThang;
            return PartialView();

        }
        public ActionResult ExportToExcel()
        {

            ExcelPackage excel = new ExcelPackage();
            var workSheet = excel.Workbook.Worksheets.Add("Thongke");
            workSheet.TabColor = System.Drawing.Color.Red;

            workSheet.DefaultRowHeight = 24;


            //Header of table  
            //  
            workSheet.Row(2).Height = 30;
            workSheet.Row(2).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
            workSheet.Row(2).Style.Font.Bold = true;
            workSheet.Cells[2, 1].Value = "STT";
            workSheet.Cells[2, 2].Value = "MAHD";
            workSheet.Cells[2, 3].Value = "MAKH";
            workSheet.Cells[2, 4].Value = "TENKH";
            workSheet.Cells[2, 5].Value = "DIENTHOAI";
            workSheet.Cells[2, 6].Value = "DIACHI";
            workSheet.Cells[2, 7].Value = "NGAYDAT";
            workSheet.Cells[2, 8].Value = "NGAYGIAO";
            workSheet.Cells[2, 9].Value = "HTTHANHTOAN";
            workSheet.Cells[2, 10].Value = "HTGIAOHANG";
            //Body of table  
            //     string[] columns = { "MAHD", "MAKH", "TENKH", "DIENTHOAI", "DIACHI", "DONGIA", "NGAYDAT", "NGAYGIAO", "HTTHANHTOAN", "HTGIAOHANG"};

            int recordIndex = 3;
            foreach (var student in db.HOADONs)
            {
                workSheet.Cells[recordIndex, 1].Value = (recordIndex - 2).ToString();
                workSheet.Cells[recordIndex, 2].Value = student.MAHD;
                workSheet.Cells[recordIndex, 3].Value = student.MAKH;
                workSheet.Cells[recordIndex, 4].Value = student.TENKH;
                workSheet.Cells[recordIndex, 5].Value = student.DIENTHOAI;
                workSheet.Cells[recordIndex, 6].Value = student.DIACHI;
                workSheet.Cells[recordIndex, 7].Value = student.NGAYDAT.ToString();
                workSheet.Cells[recordIndex, 8].Value = student.NGAYGIAO.ToString();
                workSheet.Cells[recordIndex, 9].Value = student.HTTHANHTOAN;
                workSheet.Cells[recordIndex, 10].Value = student.HTGIAOHANG;
                recordIndex++;
            }
            workSheet.Column(1).AutoFit();
            workSheet.Column(2).AutoFit();
            workSheet.Column(3).AutoFit();
            workSheet.Column(4).AutoFit();
            workSheet.Column(5).AutoFit();
            workSheet.Column(6).AutoFit();
            workSheet.Column(7).AutoFit();
            workSheet.Column(8).AutoFit();
            workSheet.Column(9).AutoFit();
            workSheet.Column(10).AutoFit();
            string excelName = "ThongKe";
            using (var memoryStream = new MemoryStream())
            {
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment; filename=" + excelName + ".xlsx");
                excel.SaveAs(memoryStream);
                memoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();

            }
            return View("");
        }
        public ActionResult Export()
        {
           
                if (Session["ADMIN"] == null)
                {
                    return View(db.HOADONs.OrderBy(h=>h.MAHD).ToList());
                }
                var data = Session["ADMIN"];
                var thongke = new GridView();
                thongke.DataSource = data;
                thongke.DataBind();
                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "utf-8";
                Response.ContentType = "application/application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;filename= Báo cáo thống kê" + ( Encoding.UTF8) + ".xls");
                Response.ContentEncoding = System.Text.Encoding.UTF8;
                Response.BinaryWrite(System.Text.Encoding.UTF8.GetPreamble());
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                for (int i = 0; i < thongke.Rows.Count; i++)
                {
                    thongke.Rows[i].Attributes.Add("class", "textmode");
                    thongke.Rows[i].Cells[0].Text = (i = 1).ToString();
                    thongke.Rows[i].Cells.RemoveAt(11);
                }
                thongke.HeaderRow.BackColor = System.Drawing.Color.DarkGreen;
                thongke.HeaderStyle.ForeColor = System.Drawing.Color.White;
                thongke.HeaderRow.Cells[0].Text = "sdsd";
                thongke.HeaderRow.Cells[1].Text = "sdssssd";
                thongke.HeaderRow.Cells[2].Text = "ffgf";
                thongke.HeaderRow.Cells[3].Text = "hghg";
                thongke.HeaderRow.Cells[4].Text = "jhjg";
                thongke.HeaderRow.Cells[5].Text = "jkh";
                thongke.HeaderRow.Cells[6].Text = "hgjg";
                thongke.HeaderRow.Cells[7].Text = "sddgfsd";
                thongke.HeaderRow.Cells[8].Text = "ret";
                thongke.HeaderRow.Cells[9].Text = "qưq";
                thongke.HeaderRow.Cells[10].Text = "jm";
                thongke.HeaderRow.Cells[11].Visible = false;

                thongke.RenderControl(hw);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
                var oder = db.HOADONs.OrderBy(h => h.MAHD).ToList();
                return View();
           
        }
    }
}