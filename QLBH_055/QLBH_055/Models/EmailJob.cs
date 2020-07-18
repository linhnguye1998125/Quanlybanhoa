using QLBH_055.Models;
using Quartz;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using QLBH_055.Controllers;
using System.Web;
using System.Web.Helpers;
using System.Web.Hosting;

namespace QLBH_055
{
    public class EmailJob : IJob
    {
        private const string BulkSetPriceFile = "Update.html";
        static QLBHEntities db = new QLBHEntities();
        public void Execute(IJobExecutionContext context)
        {
            try
            {
                string listevent = "";
           
                var allemail = db.KHACHHANGs.ToList();
                //var alllink = db.Candidate_in_Event.ToList();
                string ngayHeThong = DateTime.Now.ToString("dd/MM/yyyy");
                int ngaycuahethong = Convert.ToInt32(ngayHeThong.Substring(0, 2)); /*Ngày của hệ thống*/
                string listEmail = "";


                //var converdate = listevent;
                //int ngay = Convert.ToInt32(converdate.Substring(0, 2));
                //int thang = Convert.ToInt32(converdate.Substring(3, 2));
                //int nam = Convert.ToInt32(converdate.Substring(6, 4));

                //int ketqua = ngay - ngaycuahethong;

                //  int result = datetime.CompareTo(ngayHeThong);/*Nếu bằng nhau thì result = 0; băng 1 thì lớn hơn;-1 thì nhỏ hơn*/


                var senderEmail = new MailAddress("linhnguyen1998125@gmail.com", "linh admin");/*người gửi*/
                var receiverEmail = new MailAddress("linhnguyen1998125@gmail.com");/*người nhận*/
                var password = "01672325249aA";/*password của người gửi*/
                var sub = "Chào các bạn đã đến với website Bán Hoa :" + DateTime.Now;/*chủ để*/
                string noidung = "sdsd";
                string ten = "dsds";
             
                string FilePath = HostingEnvironment.MapPath(@"~/Template/Update.html");
                    StreamReader str = new StreamReader(FilePath);
                    string MailText = str.ReadToEnd();/*Đọc file*/

                    MailText = MailText.Replace("{{noidung}}", noidung.ToString());
                    MailText = MailText.Replace("{{ten}}", ten.ToString());
      

                    str.Close(); /*đóng*/
                    var body = MailText;/*nội dung*/


                    var smtp = new SmtpClient/* khởi tạo phương thức SMTP*//*nhận hay truyền tải dữ liệu trong email của người dùng*/
                    {
                        Host = "smtp.gmail.com",  /*trả về host name của SMTP Server đích cho tên miền đó*/
                        Port = 587,
                        EnableSsl = true,
                        DeliveryMethod = SmtpDeliveryMethod.Network,
                        UseDefaultCredentials = false,
                        Credentials = new NetworkCredential(senderEmail.Address, password) /*xác thực thông tin của tài khoản người gửi*/
                    };
                    using (var mess = new MailMessage(senderEmail, receiverEmail)  /*chuẩn bị các thành phần gửi mail */
                    {
                        Subject = sub,
                        Body = body
                    })

                    {
                        mess.IsBodyHtml = true;
                        smtp.Send(mess); /*gửi mail */

                    }
               

                //for (int i = 0; i < allemail.Count(); i++)
                //{
                //    string idCD = allemail[i].MAKH.ToString();

                //        listEmail += allemail[i].EMAIL + ",";
                //        while (listEmail.IndexOf(" ") >= 0)    //tim trong chuoi vi tri co 2 khoang trong tro len      
                //            listEmail = listEmail.Replace(" ", ""); //sau do thay the bang 1 khoang trong   
                //        var result1 = listEmail.Substring(0, listEmail.Length - 1);
                //        var senderEmail = new MailAddress("linhnguyen1998125@gmail.com", "linh admin");/*người gửi*/
                //        var receiverEmail = new MailAddress(result1);/*người nhận*/
                //        string FilePath = HostingEnvironment.MapPath(@"~/Template/giohang.html");
                //        StreamReader str = new StreamReader(FilePath);
                //        string MailText = str.ReadToEnd();/*Đọc file*/

                //        var ten = allemail[i].HOTEN.ToString();
                //        var email = allemail[i].EMAIL.ToString();
                //        var ngaysinh = allemail[i].NGAYSINH.ToString();
                //        //Xóa giờ đi còn ngày thôi
                //        int date = Convert.ToInt32(ngaysinh.Substring(0, 2));
                //        int month = Convert.ToInt32(ngaysinh.Substring(3, 2));
                //        int year = Convert.ToInt32(ngaysinh.Substring(6, 4));
                //        DateTime ngaydate = new DateTime(year, month, date);
                //        string truedate = ngaydate.ToString("dd/MM/yyyy");


                //        MailText = MailText.Replace("{{ten}}", ten.ToString());
                //        MailText = MailText.Replace("{{ngaysinh}}", truedate.ToString());
                //        MailText = MailText.Replace("{{Email}}", email.ToString());

                //        str.Close(); /*đóng*/
                //        var password = "01672325249aA";/*password của người gửi*/
                //        var sub = "Chủ đề " + DateTime.Now;/*chủ để*/
                //        var body = MailText;/*nội dung*/
                //        var smtp = new SmtpClient/* khởi tạo phương thức SMTP*//*nhận hay truyền tải dữ liệu trong email của người dùng*/
                //        {
                //            Host = "smtp.gmail.com",  /*trả về host name của SMTP Server đích cho tên miền đó*/
                //            Port = 587,
                //            EnableSsl = true,
                //            DeliveryMethod = SmtpDeliveryMethod.Network,
                //            UseDefaultCredentials = false,
                //            Credentials = new NetworkCredential(senderEmail.Address, password) /*xác thực thông tin của tài khoản người gửi*/
                //        };
                //        using (var mess = new MailMessage(senderEmail, receiverEmail)  /*chuẩn bị các thành phần gửi mail */
                //        {
                //            Subject = sub,
                //            Body = body
                //        })

                //        {
                //            mess.IsBodyHtml = true;
                //            smtp.Send(mess); /*gửi mail */
                //        }
                //        idCD = "";

                //        listEmail = "";

                //}




            }
            catch (Exception e)
            {
                e.GetBaseException();
            }
        }

    }
}