using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace QLBH_055
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            //Đường dẫn trang hướng dẫn mua hàng
            routes.MapRoute(
                name: "Muahang",
                url: "Mua-Hang/{id}",
                defaults: new { controller = "Footer", action = "MuaHang", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
            );
            routes.MapRoute(
              name: "Mua-Hang",
             url: "{controller}/Mua-Hang/{id}",
             defaults: new { controller = "Footer", action = "MuaHang", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
          );

            //Đường dẫn trang Liên hệ
            routes.MapRoute(
                name: "LienHe",
                url: "Lien-He/{id}",
                defaults: new { controller = "Home", action = "LienHe", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
            );
            routes.MapRoute(
                name: "Lien-He",
                url: "{controller}/Lien-He/{id}",
                defaults: new { controller = "Home", action = "LienHe", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
            );
            //Đường dẫn trang chính sách
            routes.MapRoute(
                name: "Chinhsach",
                url: "Chinhsach",
                defaults: new { controller = "Home", action = "Chinhsach", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
            );
            //Đường dẫn trang giới thiệu
            routes.MapRoute(
                name: "GioiThieu",
                url: "Gioi-Thieu/{id}",
                defaults: new { controller = "Home", action = "GioiThieu", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
            );
            routes.MapRoute(
              name: "Gioi-Thieu",
             url: "{controller}/Gioi-Thieu/{id}",
             defaults: new { controller = "Home", action = "GioiThieu", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
          );

            //Đường dẫn trang địa chỉ
            routes.MapRoute(
                name: "DiaChi",
                url: "DiaChi",
                defaults: new { controller = "Home", action = "DiaChi", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
            );
            //Ý nghãi hoa
            routes.MapRoute(
             name: "y-nghia",
             url: "y-nghia",
             defaults: new { controller = "Home", action = "Ynghahoa", id = UrlParameter.Optional },
             namespaces: new string[] { "QLBH_055.Controllers" }
         );
            routes.MapRoute(
              name: "Ynghahoa",
              url: "{controller}/y-nghia",
              defaults: new { controller = "Home", action = "Ynghahoa", id = UrlParameter.Optional },
              namespaces: new string[] { "QLBH_055.Controllers" }
          );
            //hoa tu chon
            routes.MapRoute(
             name: "Tu-Chon",
             url: "Tu-Chon",
             defaults: new { controller = "Home", action = "Hoatuchon", id = UrlParameter.Optional },
             namespaces: new string[] { "QLBH_055.Controllers" }

         );
            routes.MapRoute(
               name: "Hoatuchon",
               url: "{controller}/Tu-Chon",
               defaults: new { controller = "Home", action = "Hoatuchon", id = UrlParameter.Optional },
               namespaces: new string[] { "QLBH_055.Controllers" }
           );

            //Chi tiết tin tức
            routes.MapRoute(
                name: "ChiTietTinTuc",
                url: "Chi-Tiet-Tin-Tuc/{id}",
                defaults: new { controller = "Home", action = "ChiTietTinTucPartial", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
            );
            routes.MapRoute(
                name: "Chi-Tiet-Tin-Tuc",
                url: "{controller}/Chi-Tiet-Tin-Tuc/{id}",
                defaults: new { controller = "Home", action = "ChiTietTinTucPartial", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
            );

            //Đường dẫn trang tin tức
            routes.MapRoute(
                name: "TinTuc",
                url: "Tin-Tuc/{id}",
                defaults: new { controller = "Home", action = "TinTuc", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
            );
            routes.MapRoute(
                name: "Tin-Tuc",
                url: "{controller}/Tin-Tuc/{id}",
                defaults: new { controller = "Home", action = "TinTuc", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
            );


            //Routes Thêm vào giỏ hàng
            routes.MapRoute(
                name: "Add Cart",
                url: "Them-gio-hang",
                defaults: new { controller = "Home", action = "AddItem", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
            );

            // Đường dẫn tới giỏ hàng
            routes.MapRoute(
                name: "GioHang",
                url: "Gio-Hang/{id}",
                defaults: new { controller = "Home", action = "GioHang", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
            );
            routes.MapRoute(
                name: "Gio-Hang",
                url: "Gio-Hang/{id}",
                defaults: new { controller = "Home", action = "GioHang", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
            );

            // Đường dẫn tới Chi tiết sản phẩm
            routes.MapRoute(
                name: "Chi-Tiet",
                url: "Chi-Tiet/{id}",
                defaults: new { controller = "Home", action = "ChiTietSanPham", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
            );
            routes.MapRoute(
                name: "ChiTiet",
                url: "{controller}/Chi-Tiet/{id}",
                defaults: new { controller = "Home", action = "ChiTietSanPham", id = UrlParameter.Optional },
                 namespaces: new string[] { "QLBH_055.Controllers" }
            );

            // Đường dẫn tới Sản phẩm
            routes.MapRoute(
                name: "SanPham",
                url: "San-Pham",
                defaults: new { controller = "Home", action = "SanPham", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
            );
            routes.MapRoute(
                name: "San-Pham",
                url: "{controller}/San-Pham",
                defaults: new { controller = "Home", action = "SanPham", id = UrlParameter.Optional }
            );


            //Đường dẫn tới trang đăng nhập facebook
            routes.MapRoute(
                name: "DangNhapFacebook",
                url: "Dang-Nhap-Facebook",
                defaults: new { controller = "Header", action = "LoginFacebook", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
            );

            //Đường dẫn tới trang đăng nhập
            routes.MapRoute(
                name: "DangNhap",
                url: "Dang-Nhap",
                defaults: new { controller = "Header", action = "DangNhap", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
            );

            // Đường dẫn tới trang đăng ký
            routes.MapRoute(
                name: "DangKy",
                url: "Dang-Ky",
                defaults: new { controller = "Header", action = "DangKy", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
            );
            //Thông tin cá nhân
            routes.MapRoute(
                name: "ThongTinCaNhan",
                url: "Thong-Tin-Ca-Nhan/{id}",
                defaults: new { controller = "Header", action = "ThongTinCaNhan", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
            );
            routes.MapRoute(
                name: "Thong-Tin-Ca-Nhan",
                url: "{controller}/Thong-Tin-Ca-Nhan/{id}",
                defaults: new { controller = "Header", action = "ThongTinCaNhan", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
            );
            // Đường dẫn tới trang đăng xuất
            routes.MapRoute(
                name: "DangXuat",
                url: "Dang-Xuat",
                defaults: new { controller = "Header", action = "DangXuat", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
            );

            // Đường dẫn của trang chủ
            routes.MapRoute(
                name: "TrangChu",
                url: "Trang-Chu",
                defaults: new { controller = "Home", action = "TrangChu", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
            );
            routes.MapRoute(
                name: "Trang-Chu",
                url: "{controller}/Trang-Chu",
                defaults: new { controller = "Home", action = "TrangChu", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
            );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "TrangChu", id = UrlParameter.Optional },
                namespaces: new string[] { "QLBH_055.Controllers" }
            );
        }
    }
}
