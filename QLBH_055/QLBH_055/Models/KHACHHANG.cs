//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QLBH_055.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class KHACHHANG
    {
        public KHACHHANG()
        {
            this.HOADONs = new HashSet<HOADON>();
        }
    
        public int MAKH { get; set; }
        public string HOTEN { get; set; }
        public string DIENTHOAI { get; set; }
        public string EMAIL { get; set; }
        public string MATKHAU { get; set; }
        public string GIOITINH { get; set; }
        public Nullable<System.DateTime> NGAYSINH { get; set; }
        public string DIACHI { get; set; }
        public Nullable<bool> TRANGTHAI { get; set; }
    
        public virtual ICollection<HOADON> HOADONs { get; set; }
    }
}
