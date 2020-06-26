using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net.Mail;
//using System.Data.Entity.Validation;
using QLBH_055.Models;
using System.Configuration;
using Facebook;

using System.Security.Cryptography;
using System.Text;
using Microsoft.Owin.Security;
using System.Security.Claims;
using Microsoft.Owin.Security.Cookies;
using System.Data.Entity.Validation;

namespace QLBH_055.Controllers
{
    public class HeaderController : Controller
    {
        // GET: Header
        QLBHEntities db = new QLBHEntities();
        public PartialViewResult HeaderPartial()
        {
            var cart = Session["GioHang"];
            var list = new List<GioHang>();
            if (cart != null)
            {
                list = (List<GioHang>)cart;
            }
            return PartialView(list);
        }
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        public string encryption(String password)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] encrypt;
            UTF8Encoding encode = new UTF8Encoding();
            //encrypt the given password string into Encrypted data  
            encrypt = md5.ComputeHash(encode.GetBytes(password));
            StringBuilder encryptdata = new StringBuilder();
            //Create a new string by using the encrypted data  
            for (int i = 0; i < encrypt.Length; i++)
            {
                encryptdata.Append(encrypt[i].ToString());
            }
            return encryptdata.ToString();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateGoogleCaptcha]
        public ActionResult DangNhap(FormCollection f)
        {

            string Email = f["EMAIL"];
            string Passwork = f["MATKHAU"];
            string hash;
            using (MD5 md5Hash = MD5.Create())
            {
                hash = GetMd5Hash(md5Hash, Passwork);
            }

            string Pass = encryption(Passwork);
            KHACHHANG kh = db.KHACHHANGs.FirstOrDefault(n => n.EMAIL == Email && n.MATKHAU == hash && n.TRANGTHAI == true);
            try
            {
                if (kh != null)
                {
                    Session["MAKH"] = kh.MAKH.ToString();
                    Session["HoTen"] = kh.HOTEN.ToString(); ;
                    return Redirect("~/Trang-Chu");
                }
                else
                {
                    if (Email == "" || Passwork == "")
                    {
                        ModelState.AddModelError("", "Email và mật khẩu không được bỏ trống");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Email hoặc mật khẩu sai! Xin vui lòng kiểm tra lại");
                    }
                }

            }
            catch (Exception e)
            {

            }
            //catch (DbEntityValidationException dbEx)
            //{
            //    ErorrException(dbEx);
            //}
            return View(kh);
        }
        public ActionResult DangXuat()
        {
            Session["MAKH"] = null;
            Session["GioHang"] = null;
            Session["HoTen"] = null;
            return Redirect("~/Trang-Chu");
        }
        public ActionResult DangKy()
        {

            return View();
        }



        static string GetMd5Hash(MD5 md5Hash, string input)
        {

            // Convert the input string to a byte array and compute the hash.
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

            // Create a new Stringbuilder to collect the bytes
            // and create a string.
            StringBuilder sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data 
            // and format each one as a hexadecimal string.
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x1"));
            }

            // Return the hexadecimal string.
            return sBuilder.ToString();
        }
        [HttpPost]
        public ActionResult DangKy(KHACHHANG kh)
        {
            try
            {
                string hash;
                if (kh.GIOITINH.ToString() == "1")
                {
                    kh.GIOITINH = "Nam";
                }
                if (kh.GIOITINH.ToString() == "0")
                {
                    kh.GIOITINH = "Nữ";
                }
                kh.TRANGTHAI = true;

                using (MD5 md5Hash = MD5.Create())
                {
                    hash = GetMd5Hash(md5Hash, kh.MATKHAU);
                }
                kh.MATKHAU = hash;
                db.KHACHHANGs.Add(kh);
                db.SaveChanges();
                return RedirectToAction("DangNhap", "Header");
            }
            catch (Exception e)
            {

            }
            return View();
            //catch (DbEntityValidationException dbEx)
            //{
            //    ErorrException(dbEx);
            //}
        }
        //public void ErorrException(DbEntityValidationException dbEx)
        //{
        //    foreach (var validationErrors in dbEx.EntityValidationErrors)
        //    {
        //        foreach (var validationError in validationErrors.ValidationErrors)
        //        {
        //            System.Console.WriteLine("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
        //        }
        //    }
        //}
        public string GetQC(int ThuTuQC)
        {
            var qc = db.QUANGCAOs.SingleOrDefault(n => n.THUTUQC == ThuTuQC && n.TRANGTHAI == true);
            string Anh = "";
            Anh += qc.ANHQC.ToString();
            return Anh;
        }

        public ActionResult ThongTinCaNhan()
        {
            int MAKH = int.Parse(Session["MAKH"].ToString());
            var TTKhachHang = db.KHACHHANGs.SingleOrDefault(n => n.MAKH == MAKH);
            ViewBag.GIOITINH = TTKhachHang.GIOITINH;
            return View(TTKhachHang);
        }
        [HttpPost]
        public ActionResult ThongTinCaNhan(FormCollection fc)
        {

            string hash;
            int MAKH = int.Parse(Session["MAKH"].ToString());
            var UpdateKH = db.KHACHHANGs.SingleOrDefault(n => n.MAKH == MAKH);
            UpdateKH.MAKH = MAKH;
            UpdateKH.HOTEN = fc["HOTEN"].ToString();
            string GioiTinh = fc["GIOITINH"].ToString();
            if (GioiTinh == "1")
            {
                UpdateKH.GIOITINH = "Nam";
            }
            else
            {
                UpdateKH.GIOITINH = "Nữ";
            }
            UpdateKH.DIENTHOAI = fc["DIENTHOAI"].ToString();
            using (MD5 md5Hash = MD5.Create())
            {
                hash = GetMd5Hash(md5Hash, fc["MATKHAU"].ToString());
            }
            UpdateKH.MATKHAU = hash;
            UpdateKH.DIACHI = fc["DIACHI"].ToString();

            UpdateKH.NGAYSINH = DateTime.Parse(fc["NGAYSINH"].ToString());

            UpdateModel(UpdateKH);
            db.SaveChanges();

            //catch (DbEntityValidationException dbEx)
            //{
            //    ErorrException(dbEx);
            //}
            return RedirectToAction("ThongTinCaNhan", "Header");
        }
        public ActionResult DoiMatKhau()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DoiMatKhau(FormCollection f)
        {
            // string hash;
            string matkhau = "202cb962ac5975b964b7152d234b70";
            string EmailAdmin = "linhnguyen1998125@gmail.com";
            string EmailClient = f["EMAIL"].ToString();

            var SetMauKhau = db.KHACHHANGs.SingleOrDefault(n => n.EMAIL == EmailClient);
            if (SetMauKhau != null)
            {

                //using (MD5 md5Hash = MD5.Create())
                //{
                //    hash = GetMd5Hash(md5Hash, matkhau);
                //}
                //string k = hash;
                SetMauKhau.MATKHAU = matkhau.ToString();
                UpdateModel(SetMauKhau);

                db.SaveChanges();
                MailMessage mail = new MailMessage();
                mail.To.Add(EmailClient);
                mail.From = new MailAddress(EmailAdmin);
                mail.Subject = " Đặt lại mật khẩu website bán hoa";
                mail.Body = "Mật khẩu của bạn đã được đặt lại là: <strong>123<strong>";
                mail.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = new System.Net.NetworkCredential(EmailAdmin, "01672325249aA");
                smtp.EnableSsl = true;
                smtp.Send(mail);
                //return RedirectToAction("DangNhap", "Header");
            }


            return RedirectToAction("DangNhap", "Header");
        }
        private Uri RedirectUri
        {
            get
            {
                var uriBuilder = new UriBuilder(Request.Url);
                uriBuilder.Query = null;
                uriBuilder.Fragment = null;
                uriBuilder.Path = Url.Action("FacebookCallback");
                return uriBuilder.Uri;
            }
        }
        public ActionResult LoginFacebook()
        {
            var fb = new FacebookClient();
            var loginUrl = fb.GetLoginUrl(new
            {
                client_id = ConfigurationManager.AppSettings["fbAppId"],
                client_secret = ConfigurationManager.AppSettings["fbAppSecret"],
                redirect_uri = RedirectUri.AbsoluteUri,
                response_type = "code",
                scope = "email"
            });
            return Redirect(loginUrl.AbsoluteUri);
        }
        public ActionResult FacebookCallback(string Code)
        {
            var fb = new FacebookClient();
            dynamic result = fb.Post("oauth/access_token", new
            {
                client_id = ConfigurationManager.AppSettings["fbAppId"],
                client_secret = ConfigurationManager.AppSettings["fbAppSecret"],
                redirect_uri = RedirectUri.AbsoluteUri,
                code = Code
            });
            var access_token = result.access_token;
            if (!string.IsNullOrEmpty(access_token))
            {
                fb.AccessToken = access_token;
                dynamic me = fb.Get("me?fields=first_name,middle_name,last_name,id,email");
                string id = me.id;
                string email = me.email;
                string userName = me.email;
                string fullName = me.last_name + " " + me.first_name;
                KHACHHANG kh = new KHACHHANG();
                if (email == null)
                {
                    kh.EMAIL = "facebook@gmail.com";
                }
                else
                {
                    kh.EMAIL = email;
                }
                kh.GIOITINH = null;
                kh.MATKHAU = null;
                kh.NGAYSINH = null;
                kh.DIACHI = null;
                kh.DIENTHOAI = null;
                kh.HOTEN = fullName;
                kh.TRANGTHAI = true;
                var khachHang = db.KHACHHANGs.SingleOrDefault(n => n.EMAIL == kh.EMAIL);
                if (khachHang == null)
                {
                    db.KHACHHANGs.Add(kh);
                    db.SaveChanges();
                    var thongTinKhachHang = db.KHACHHANGs.SingleOrDefault(n => n.EMAIL == kh.EMAIL);
                    Session["MAKH"] = thongTinKhachHang.MAKH;
                    Session["HoTen"] = thongTinKhachHang.HOTEN;
                    return Redirect("/");
                }
                else
                {
                    Session["MAKH"] = khachHang.MAKH;
                    Session["HoTen"] = khachHang.HOTEN;
                    return Redirect("~/Trang-Chu");
                }

            }
            return View();
        }
        public void SignIn(string ReturnUrl = "/", string type = "")
        {
            if (!Request.IsAuthenticated)
            {
                if (type == "Google")
                {
                    HttpContext.GetOwinContext().Authentication.Challenge(new AuthenticationProperties { RedirectUri = "Header/GoogleLoginCallback" }, "Google");
                }
            }
            //KHACHHANG kh = new KHACHHANG();
            //var khachHang = db.KHACHHANGs.SingleOrDefault(n => n.EMAIL == kh.EMAIL);

        }
        public ActionResult SignOut()
        {
            HttpContext.GetOwinContext().Authentication.SignOut(CookieAuthenticationDefaults.AuthenticationType);
            Session["HoTen"] = null;
            Session["MaKH"] = null;
            Session["GioHang"] = null;
            return RedirectToAction("Trang-Chu", "Home");
        }
        [AllowAnonymous]
        public ActionResult GoogleLoginCallback()
        {
            var claimsPrincipal = HttpContext.User.Identity as ClaimsIdentity;

            var loginInfo = GoogleLoginViewModel.GetLoginInfo(claimsPrincipal);
            if (loginInfo == null)
            {
                return RedirectToAction("Index");
            }



            var user = db.KHACHHANGs.FirstOrDefault(x => x.EMAIL == loginInfo.emailaddress);
            Session["MAKH"] = user.MAKH.ToString();
            Session["HoTen"] = user.HOTEN.ToString();
            try
            {
                if (user == null)
                {
                    user = new KHACHHANG
                    { //kh.GIOITINH = null;
                      //kh.MATKHAU = null;
                      //kh.NGAYSINH = null;
                      //kh.DIACHI = null;
                      //kh.DIENTHOAI = null;
                      //kh.HOTEN = fullName;
                      //kh.TRANGTHAI = true;
                        GIOITINH = null,
                        NGAYSINH = null,
                        TRANGTHAI = true,
                        EMAIL = loginInfo.emailaddress,
                        HOTEN = loginInfo.surname + loginInfo.givenname,
                        DIENTHOAI = null,
                        MATKHAU = null,
                        DIACHI = null,


                    };
                    db.KHACHHANGs.Add(user);

                    db.SaveChanges();

                }

            }
            catch (DbEntityValidationException e)
            { }


            var ident = new ClaimsIdentity(
                    new[] { 
								// adding following 2 claim just for supporting default antiforgery provider
								new Claim(ClaimTypes.NameIdentifier, user.EMAIL),
                                new Claim("http://schemas.microsoft.com/accesscontrolservice/2010/07/claims/identityprovider", "ASP.NET Identity", "http://www.w3.org/2001/XMLSchema#string"),

                                new Claim(ClaimTypes.Name, user.HOTEN),
                                new Claim(ClaimTypes.Email, user.EMAIL),
								// optionally you could add roles if any
								new Claim(ClaimTypes.Role, "User")
                    },
                    CookieAuthenticationDefaults.AuthenticationType);


            HttpContext.GetOwinContext().Authentication.SignIn(
                        new AuthenticationProperties { IsPersistent = false }, ident);
            var thongTinKhachHang = db.KHACHHANGs.SingleOrDefault(n => n.EMAIL == user.EMAIL);
            Session["MAKH"] = thongTinKhachHang.MAKH;
            Session["HoTen"] = thongTinKhachHang.HOTEN;
            return Redirect("~/");

        }

    }
}