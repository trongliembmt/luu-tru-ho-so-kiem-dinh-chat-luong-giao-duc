using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Website_KĐCLGD.Models
{
    public class ThongKe_Admin
    {
        public int MaNhanSu { get; set; }
        public string TenNhanSu { get; set; }
        public float Diem { get; set; }
        public int SoLanDat { get; set; }
        public int SoLanChuaDat { get; set; }

        public ThongKe_Admin(int MaNhanSu, string TenNhanSu, float Diem, int SoLanDat, int SoLanChuaDat)
        {
            this.MaNhanSu = MaNhanSu;
            this.TenNhanSu = TenNhanSu;
            this.Diem = Diem;
            this.SoLanDat = SoLanDat;
            this.SoLanChuaDat = SoLanChuaDat;
        }
    }
}