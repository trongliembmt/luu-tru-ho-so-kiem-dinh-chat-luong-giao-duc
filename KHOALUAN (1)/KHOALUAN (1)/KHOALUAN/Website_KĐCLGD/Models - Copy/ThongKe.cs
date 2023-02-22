using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Website_KĐCLGD.Models
{
    public class ThongKe
    {
        public string DanhGia { get; set; }
        public string Diem { get; set; }
        public string NoiDung { get; set; }
        public int MaNhanSu { get; set; }
        public string TenNhanSu { get; set; }
        public string NgayDG { get; set; }
        public string TinhTrang { get; set; }
        public int MaNhom { get; set; }

        public ThongKe(string DanhGia, string Diem, string NoiDung, int MaNhanSu, string TenNhanSu, string NgayDG, string TinhTrang, int MaNhom)
        {
            this.DanhGia = DanhGia;
            this.Diem = Diem;
            this.NoiDung = NoiDung;
            this.MaNhanSu = MaNhanSu;
            this.TenNhanSu = TenNhanSu;
            this.NgayDG = NgayDG;
            this.TinhTrang = TinhTrang;
            this.MaNhom = MaNhom;
        }
    }
}