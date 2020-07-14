using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Helpers;
using System.Web.Hosting;

namespace QLBH_055.Models
{
    public class SendEmail
    {
        private QLBHEntities db = new QLBHEntities();
        public void sendEmail(string ten, string email, string noidung)
        {

            var senderEmail = new MailAddress("linhnguyen1998125@gmail.com", "linh admin");/*người gửi*/
            var receiverEmail = new MailAddress(email);/*người nhận*/
            var password = "01672325249aA";/*password của người gửi*/
            var sub = "Chào các bạn đã đến với website Bán Hoa :" + DateTime.Now;/*chủ để*/
            if(noidung != ""){
                string FilePath = HostingEnvironment.MapPath(@"~/Template/Create.html");
                StreamReader str = new StreamReader(FilePath);
                string MailText = str.ReadToEnd();/*Đọc file*/

                MailText = MailText.Replace("{{noidung}}", noidung.ToString());
                MailText = MailText.Replace("{{ten}}", ten.ToString());
                MailText = MailText.Replace("{{Email}}", email.ToString());

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
            }
            else
            {
                if (ten == "")
                {
         
                    string FilePath = HostingEnvironment.MapPath(@"~/Template/Update.html");
                    StreamReader str = new StreamReader(FilePath);
                    string MailText = str.ReadToEnd();/*Đọc file*/
                    MailText = MailText.Replace("{{ten}}", email.ToString());
                    MailText = MailText.Replace("{{Email}}", null);
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
                }
                else
                {
                    string FilePath = HostingEnvironment.MapPath(@"~/Template/Update.html");
                    StreamReader str = new StreamReader(FilePath);
                    string MailText = str.ReadToEnd();/*Đọc file*/
                    MailText = MailText.Replace("{{ten}}", ten.ToString());
                    MailText = MailText.Replace("{{Email}}", email.ToString());

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
                }
               
            }
           
 
               
        }
        public void autosendEmail(string email, int mahd,string ghichu)
        {
            var tenkh = "";
        
            var diachi = "";
            var ngaydat = "";
            var ngaygiao = "";
            var httt = "";
            var htgh = "";
            var dongia = "";
            var senderEmail = new MailAddress("linhnguyen1998125@gmail.com", "linh admin");/*người gửi*/
            var receiverEmail = new MailAddress(email);/*người nhận*/
            var password = "01672325249aA";/*password của người gửi*/
            var sub = "Chào các bạn đã đến với website Bán Hoa :" + DateTime.Now;/*chủ để*/
            var CTHoaDon = db.HOADONs.Where(n => n.MAHD == mahd).ToList();
            foreach (var item in CTHoaDon)
            {
                tenkh = @item.TENKH.ToString();
                diachi = @item.DIACHI.ToString();
                ngaydat = @item.NGAYDAT.ToString();
                ngaygiao = @item.NGAYGIAO.ToString();
                httt = @item.HTTHANHTOAN.ToString();
                htgh = @item.HTGIAOHANG.ToString();
                dongia =   @item.DONGIA.ToString();
            }

                string FilePath = HostingEnvironment.MapPath(@"~/Template/giohang.html");
                StreamReader str = new StreamReader(FilePath);
                string MailText = str.ReadToEnd();/*Đọc file*/
  
   
            MailText = MailText.Replace("{{mahd}}", mahd.ToString());
            MailText = MailText.Replace("{{tenkh}}", tenkh);
            MailText = MailText.Replace("{{diachi}}", diachi);
            MailText = MailText.Replace("{{ngaydat}}", ngaydat);
            MailText = MailText.Replace("{{ngaygiao}}", ngaygiao);
            MailText = MailText.Replace("{{httt}}", httt);
            MailText = MailText.Replace("{{htgh}}", htgh);
            MailText = MailText.Replace("{{dongia}}", dongia);
            MailText = MailText.Replace("{{ghichu}}", ghichu);

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
            
          



        }
        public void sendEmailgiohangtchon(string ten, string email, string noidung, string loaihoa, string sl, string hoa)
        {

            var senderEmail = new MailAddress("linhnguyen1998125@gmail.com", "linh admin");/*người gửi*/
            var receiverEmail = new MailAddress(email);/*người nhận*/
            var password = "01672325249aA";/*password của người gửi*/
            var sub = "Chào các bạn đã đến với website Bán Hoa :" + DateTime.Now;/*chủ để*/
            if (noidung != "")
            {
                string FilePath = HostingEnvironment.MapPath(@"~/Template/giohangtuchon.html");
                StreamReader str = new StreamReader(FilePath);
                string MailText = str.ReadToEnd();/*Đọc file*/

                MailText = MailText.Replace("{{noidung}}", noidung.ToString());
                MailText = MailText.Replace("{{ten}}", ten.ToString());
                MailText = MailText.Replace("{{Email}}", email.ToString());
                MailText = MailText.Replace("{{loaihoa}}", loaihoa.ToString());
                MailText = MailText.Replace("{{sl}}", sl.ToString());
                MailText = MailText.Replace("{{hoa}}", hoa.ToString());

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
            }
            else
            {
                if (ten == "")
                {
                    string tt = "Website Hoa Tươi";
                    string FilePath = HostingEnvironment.MapPath(@"~/Template/giohangtuchon.html");
                    StreamReader str = new StreamReader(FilePath);
                    string MailText = str.ReadToEnd();/*Đọc file*/

                    MailText = MailText.Replace("{{noidung}}", noidung.ToString());
                    MailText = MailText.Replace("{{ten}}", email.ToString());
                    MailText = MailText.Replace("{{Email}}", email.ToString());
                    MailText = MailText.Replace("{{loaihoa}}", loaihoa.ToString());
                    MailText = MailText.Replace("{{sl}}", sl.ToString());
                    MailText = MailText.Replace("{{hoa}}", hoa.ToString());
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
                }
                else
                {
                    string FilePath = HostingEnvironment.MapPath(@"~/Template/giohangtuchon.html");
                    StreamReader str = new StreamReader(FilePath);
                    string MailText = str.ReadToEnd();/*Đọc file*/
                    MailText = MailText.Replace("{{noidung}}", noidung.ToString());
                    MailText = MailText.Replace("{{ten}}", ten.ToString());
                    MailText = MailText.Replace("{{Email}}", email.ToString());
                    MailText = MailText.Replace("{{loaihoa}}", loaihoa.ToString());
                    MailText = MailText.Replace("{{sl}}", sl.ToString());
                    MailText = MailText.Replace("{{hoa}}", hoa.ToString());

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
                }

            }



        }
   
    }
}