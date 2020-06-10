using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLBH_055.Models
{
    [Serializable]
    public class HTThanhToanItem
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public HTThanhToanItem(int iD, string name)
        {
            this.Id = iD;
            this.Name = name;
        }
    }
}