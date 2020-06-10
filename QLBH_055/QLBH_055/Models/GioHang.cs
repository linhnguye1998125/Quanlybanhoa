using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLBH_055.Models
{
    public class GioHang
    {
        public int MASP { get; set; }
        public string TENSP { get; set; }
        public string ANHSP { get; set; }
        public Decimal GIASP { get; set; }
        public int SoLuong { get; set; }
        public Decimal ThanhTien
        {
            get { return GIASP * SoLuong; }
        }
    }
}