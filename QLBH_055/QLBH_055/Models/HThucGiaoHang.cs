using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLBH_055.Models
{
    [Serializable]
    public class HThucGiaoHang
    {
        public int MaGH { get; set; }
        public string NameGH { get; set; }
        public HThucGiaoHang(int maht, string namegh)
        {
            this.MaGH = maht;
            this.NameGH = namegh;
        }
    }
}