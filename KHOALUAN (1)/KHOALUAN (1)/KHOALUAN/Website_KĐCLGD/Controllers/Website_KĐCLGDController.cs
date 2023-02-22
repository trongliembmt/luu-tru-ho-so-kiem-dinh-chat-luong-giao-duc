using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website_KĐCLGD.Models;
using System.Data.SqlClient;
using System.IO;

namespace Website_KĐCLGD.Controllers
{
    public class Website_KĐCLGDController : Controller
    {
        //
        // GET: /Website_KĐCLGD/
        SqlConnection con = new SqlConnection();
        SqlCommand com = new SqlCommand();
        SqlDataReader dr;
        DB_KDCLDataContext db = new DB_KDCLDataContext();
       
        #region index
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult DangNhap(string username, string password)
        {
            if (ModelState.IsValid)
            {

                var data = db.NHANSUs.Where(s => s.TAIKHOAN.Equals(username) && s.MATKHAU.Equals(password)).ToList();
                if (data.Count() > 0)
                {
                    //add session


                    return RedirectToAction("../Website_KĐCLGD/KiemDuyet_TC");
                }
                else
                {
                    ViewBag.error = "Login failed";
                    return RedirectToAction("DangNhap");
                }
            }
            return View();


        }
        public ActionResult Search(string txtSearch, string search)
        {
            if (search.Trim().Equals("1"))
            {
                ViewBag.header = "tiêu chuẩn";
                List<TIEUCHUAN> dsTieuChuan = db.TIEUCHUANs.Where(x => x.TIEUDETIEUCHUAN.Contains(txtSearch.Trim().ToUpper())).ToList();
                ViewBag.dsTieuChuan = dsTieuChuan;
                return View();
            }
            List<TIEUCHI> dsTieuChi = db.TIEUCHIs.Where(x => x.TIEUDETIEUCHI.Contains(txtSearch.Trim().ToUpper())).ToList();
            ViewBag.header = "tiêu chí";
            ViewBag.dsTieuChi = dsTieuChi;
            return View();
        }
        #endregion
        #region HoSo_MinhChung
        public ActionResult QLHS_MinhChung(int matieuchi)
        {
            List<VW_TIEUCHI_MINHCHUNG> list = new List<VW_TIEUCHI_MINHCHUNG>();

            var data = from minhchung in db.MINHCHUNGs
                       join tieuchi in db.TIEUCHIs on minhchung.MATIEUCHI equals tieuchi.MATIEUCHI
                       where matieuchi == minhchung.MATIEUCHI
                       select new { minhchung.TENMINHCHUNG, minhchung.MAMINHCHUNG, minhchung.MATIEUCHI, tieuchi.TIEUDETIEUCHI, minhchung.DUONGDAN_ND };
            if (data != null)
            {
                foreach (var item in data)
                {
                    VW_TIEUCHI_MINHCHUNG itemMC = new VW_TIEUCHI_MINHCHUNG();
                    itemMC.MAMINHCHUNG = item.MAMINHCHUNG;
                    itemMC.MATIEUCHI = item.MATIEUCHI;
                    itemMC.TENMINHCHUNG = item.TENMINHCHUNG;
                    itemMC.DUONGDAN_ND = item.DUONGDAN_ND;
                    itemMC.TIEUDETIEUCHI = item.TIEUDETIEUCHI;
                    list.Add(itemMC);
                }
            }
            ViewBag.matieuchi = matieuchi;
            return View(list);
        }
        public ActionResult Create_MinhChung(int matieuchi)
        {
            ViewData["lstTieuChi"] = TieuChiDK(matieuchi);
            ViewData["matieuchi"] = matieuchi.ToString();
            return View();
        }

        
        [HttpPost]
        public ActionResult Create_MinhChung(string TENMINHCHUNG,int matieuchi, string MAMINHCHUNG, string selectionTieuChi, string DUONGDAN_ND)
        {
            MINHCHUNG newItem = new MINHCHUNG();
            newItem.DUONGDAN_ND = DUONGDAN_ND;
            newItem.TENMINHCHUNG = TENMINHCHUNG;
            newItem.MAMINHCHUNG = MAMINHCHUNG;
            newItem.MATIEUCHI = matieuchi;
            //string matc = selectionTieuChi;
            db.MINHCHUNGs.InsertOnSubmit(newItem);
            db.SubmitChanges();
            return new RedirectResult("QLHS_MinhChung/?matieuchi=" + newItem.MATIEUCHI);
        }
        public List<TIEUCHI> getListTieuChi()
        {
            List<TIEUCHI> lstTieuChi = db.TIEUCHIs.ToList();
            return lstTieuChi;
        }
        public ActionResult Delete_MinhChung(string mamc)
        {
            MINHCHUNG mchung = db.MINHCHUNGs.FirstOrDefault(x => x.MAMINHCHUNG == mamc);

            db.MINHCHUNGs.DeleteOnSubmit(mchung);
            db.SubmitChanges();
            return new RedirectResult("QLHS_MinhChung/?matieuchi=" + mchung.MATIEUCHI.ToString());

        }

        
        #endregion
        #region HoSo_TieuChi
        public ActionResult QLHS_TieuChi(int id)
        {
            List<VW_TIEUCHI_TIEUCHUAN> list = new List<VW_TIEUCHI_TIEUCHUAN>();
            var data = from tieuchi in db.TIEUCHIs
                       join tieuchuan in db.TIEUCHUANs on tieuchi.MATIEUCHUAN equals tieuchuan.MATIEUCHUAN
                       where tieuchi.MATIEUCHUAN == id
                       select new { tieuchi.TIEUDETIEUCHI, tieuchi.MATIEUCHI, tieuchi.MATIEUCHUAN, tieuchuan.TIEUDETIEUCHUAN, tieuchi.DUONGDAN_ND };
            if (data != null)
            {
                foreach (var item in data)
                {
                    VW_TIEUCHI_TIEUCHUAN itemTC = new VW_TIEUCHI_TIEUCHUAN();
                    itemTC.MATIEUCHI = item.MATIEUCHI;
                    itemTC.MATIEUCHUAN = item.MATIEUCHUAN;
                    itemTC.TIEUDETIEUCHI = item.TIEUDETIEUCHI;
                    itemTC.TIEUDETIEUCHUAN = item.TIEUDETIEUCHUAN;
                    itemTC.DUONGDAN_ND = item.DUONGDAN_ND;
                    list.Add(itemTC);
                }
            }
            ViewBag.matieuchuan = id;
            ViewData["listDG_TC"] = getListDanhGia_TC(id);
            ViewData["listKD_TC"] = getListKiemDuyet_TC(id);
            return View(list);
        }
        public List<KQ_DANHGIA_TIEUCHI> getListDanhGia_TC(int id)
        {
            List<KQ_DANHGIA_TIEUCHI> listDG_TC = db.KQ_DANHGIA_TIEUCHIs.Where(x => x.TIEUCHI.MATIEUCHUAN == id).ToList();
            return listDG_TC;
        }
        public List<KQ_KIEMDUYET_TIEUCCHI> getListKiemDuyet_TC(int id)
        {
            List<KQ_KIEMDUYET_TIEUCCHI> listKD_TC = db.KQ_KIEMDUYET_TIEUCCHIs.Where(x=>x.TIEUCHI.MATIEUCHUAN==id).ToList();
            return listKD_TC;
        }



        public ActionResult Create_TieuChi(int matieuchuan)
        {

            ViewData["lstTieuChuan"] = TieuChuanDK(matieuchuan);
            ViewData["matieuchuan"] = matieuchuan.ToString();
            return View();
        }
        public TIEUCHUAN TieuChuanDK(int matieuchuan)
        {
            TIEUCHUAN lstTieuChuan = db.TIEUCHUANs.FirstOrDefault(x => x.MATIEUCHUAN == matieuchuan);
            return lstTieuChuan;
        }
        [HttpPost]
        //[ValidateAntiForgeryToken]
        public ActionResult Create_TieuChi(string TIEUDETIEUCHI, int matc, string DUONGDAN_ND, string DUONGDAN_CHINHSUA)
        {
            TIEUCHI newItem = new TIEUCHI();
            newItem.DUONGDAN_ND = DUONGDAN_ND;
            newItem.TIEUDETIEUCHI = TIEUDETIEUCHI;
            newItem.DUONGDAN_CHINHSUA = DUONGDAN_CHINHSUA;
            newItem.MATIEUCHUAN = matc;
            db.TIEUCHIs.InsertOnSubmit(newItem);
            db.SubmitChanges();
            return RedirectToAction("QLHS_TieuChi/" + newItem.MATIEUCHUAN);

        }
        public List<TIEUCHUAN> getListTieuChuan()
        {
            List<TIEUCHUAN> lstTieuChuan = db.TIEUCHUANs.ToList();
            return lstTieuChuan;
        }
        public ActionResult Delete_TieuChi(int id)
        {
            TIEUCHI tchi = db.TIEUCHIs.FirstOrDefault(x => x.MATIEUCHI == id);
            if (tchi != null)
            {
                var lstMinhChung = from mchung in db.MINHCHUNGs
                                   where mchung.MATIEUCHI == id
                                   select mchung;

                foreach (MINHCHUNG itemDel in lstMinhChung)
                {
                    db.MINHCHUNGs.DeleteOnSubmit(itemDel);

                }

                db.TIEUCHIs.DeleteOnSubmit(tchi);
                db.SubmitChanges();
            }



            return RedirectToAction("QLHS_TieuChi/" + tchi.MATIEUCHUAN);
        }
        public TIEUCHI TieuChiDK(int matieuchi)
        {
            TIEUCHI lstTieuChi = db.TIEUCHIs.FirstOrDefault(x => x.MATIEUCHI == matieuchi);
            return lstTieuChi;
        }
        public ActionResult Edit_TieuChi(int matieuchi)
        {
            ViewData["lstTieuChi"] = TieuChiDK(matieuchi);
            ViewData["matieuchi"] = matieuchi.ToString();
            return View();
        }
        [HttpPost]
        public ActionResult Edit_TieuChi(string MATIEUCHI, string TIEUDETIEUCHI)
        {
            TIEUCHI itemEdit = db.TIEUCHIs.Where(a => a.MATIEUCHI == int.Parse(MATIEUCHI)).FirstOrDefault();
            if (itemEdit != null)
            {

                try
                {
                    itemEdit.TIEUDETIEUCHI = TIEUDETIEUCHI;
                    db.SubmitChanges();
                    return RedirectToAction("QLHS_TieuChi/" + itemEdit.MATIEUCHUAN);
                }
                catch (Exception ex)
                {
                    ViewData["Loi"] = "Khong sua duoc.";
                    return View();
                }

            }
            return View();
        }
        #endregion
        #region HoSo_TieuChuan
        public ActionResult QLHS_TieuChuan()
        {
            List<TIEUCHUAN> list = db.TIEUCHUANs.ToList();
            return View(list);
        }

        public ActionResult Create_TieuChuan()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create_TieuChuan([Bind(Include = "TIEUDETIEUCHUAN")] TIEUCHUAN tIEUCHUAN)
        {
            if (ModelState.IsValid)
            {
                db.TIEUCHUANs.InsertOnSubmit(tIEUCHUAN);
                db.SubmitChanges();

                return RedirectToAction("QLHS_TieuChuan");
            }
            return View(tIEUCHUAN);

        }
        public ActionResult Edit_TieuChuan(int id)
        {
            TIEUCHUAN tc = db.TIEUCHUANs.FirstOrDefault(x => x.MATIEUCHUAN == id);
            return View(tc);
        }
        [HttpPost]
        //[ValidateAntiForgeryToken]
        public ActionResult Edit_TieuChuan(TIEUCHUAN tc)
        {

            TIEUCHUAN utc = db.TIEUCHUANs.FirstOrDefault(x => x.MATIEUCHUAN == tc.MATIEUCHUAN);

            utc.TIEUDETIEUCHUAN = tc.TIEUDETIEUCHUAN;
            db.SubmitChanges();
            return RedirectToAction("QLHS_TieuChuan");



        }
        public ActionResult Delete_TieuChuan(int id)
        {
            //TIEUCHUAN tc = db.TIEUCHUANs.FirstOrDefault(x => x.MATIEUCHUAN == id);
            //if (tc != null)
            //{
            //    var lstTieuChi = from tchi in db.TIEUCHIs
            //                     where tchi.MATIEUCHUAN == id
            //                     select tchi;
            //    List<string> lstMaTieuChi = db.TIEUCHIs.Where(a => a.MATIEUCHUAN == id).Select(a => a.MATIEUCHI.ToString()).ToList();
            //    var lstMinhChung = from mchung in db.MINHCHUNGs
            //                       where lstMaTieuChi.Contains(mchung.MATIEUCHI.ToString())
            //                       select mchung;
            //    foreach (MINHCHUNG itemDel in lstMinhChung)
            //    {
            //        db.MINHCHUNGs.DeleteOnSubmit(itemDel);

            //    }
            //    foreach (TIEUCHI itemDel in lstTieuChi)
            //    {
            //        db.TIEUCHIs.DeleteOnSubmit(itemDel);

            //    }
            //    db.TIEUCHUANs.DeleteOnSubmit(tc);
            //    db.SubmitChanges();
            
            //}



            //return RedirectToAction("QLHS_TieuChuan");
            TIEUCHUAN tieuchuan = db.TIEUCHUANs.FirstOrDefault(x => x.MATIEUCHUAN == id);
            db.TIEUCHUANs.DeleteOnSubmit(tieuchuan);
            db.SubmitChanges();
            return RedirectToAction("QLHS_TieuChuan");
        }
        [HttpPost]
        public ActionResult Xoa_TieuChuan(int matc)
        {
            int ma = matc;
            string ok = "YES";
            TIEUCHI tc = db.TIEUCHIs.FirstOrDefault(x => x.MATIEUCHUAN == matc);
            if (tc != null)
            {
                ok = "NO";
            }
            else
            {
                TIEUCHUAN tieuchuan = db.TIEUCHUANs.FirstOrDefault(x => x.MATIEUCHUAN == matc);
                P2_DANHGIA p2 = db.P2_DANHGIAs.FirstOrDefault(x => x.MATIEUCHUAN == matc);
                if (tieuchuan == null)
                {
                    ok = "NO";
                }
                else
                {
                    db.TIEUCHUANs.DeleteOnSubmit(tieuchuan);
                    db.SubmitChanges();
                }
            }
            var result = new { result = ok };
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        #endregion
        #region QL_NhanSu
        public ActionResult QL_Nhansu()
        {
            List<NHANSU> list = db.NHANSUs.ToList();
            return View(list);
        }
        public ActionResult Detail_NhanSu(int id)
        {
            NHANSU ns = db.NHANSUs.FirstOrDefault(x => x.MA_NS == id);
            return View(ns);
        }

        public ActionResult Create_NhanSu()
        {
            ViewData["lstNhomQuyen"] = getListNhomQuyen();
            ViewData["lstNhom"] = getListNhom();
            ViewData["lstChucVu"] = getListChucVu();
            
            return View();
        }
        [HttpPost]
        //[ValidateAntiForgeryToken]
        public ActionResult Create_NhanSu(HttpPostedFileBase file,string TAIKHOAN, string MATKHAU, string TEN_NS, string SDT, string GIOITINH, string EMAIL, DateTime NGAYSINH, string DIACHI, string selectionNhom, string selectionNhomQuyen, string selectionChucVu)
        {
            NHANSU ns = db.NHANSUs.FirstOrDefault(x => x.TAIKHOAN == TAIKHOAN);
            NHANSU ns1 = db.NHANSUs.FirstOrDefault(x => x.SDT == SDT);
            if (ns == null && ns1 == null)
            {
                NHANSU newItem = new NHANSU();
                newItem.TEN_NS = TEN_NS;
                newItem.SDT = SDT;
                newItem.GIOITINH = GIOITINH;
                newItem.EMAIL = EMAIL;
                newItem.NGAYSINH = NGAYSINH;
                newItem.DIACHI = DIACHI;
                newItem.TAIKHOAN = TAIKHOAN;
                newItem.MATKHAU = MATKHAU;
                if (uploadimage(file) != -1)
                {
                    newItem.HINHANH = file.FileName;

                }
                newItem.MA_CV = int.Parse(selectionChucVu);
                newItem.MA_NH = int.Parse(selectionNhom);
                newItem.MA_NQ = int.Parse(selectionNhomQuyen);
                db.NHANSUs.InsertOnSubmit(newItem);
                db.SubmitChanges();
                return RedirectToAction("QL_NhanSu");
            }
            else
            {
                return RedirectToAction("thongbao");
            }
        }
        /// image
        public int uploadimage(HttpPostedFileBase file)
        {
            int path = -1;
            try
            {
                if (file.ContentLength > 0)
                {
                    string filename = Path.GetFileName(file.FileName);
                    string filepath = Path.Combine(Server.MapPath("~/Content/image/user"), filename);
                    file.SaveAs(filepath);
                    path = 0;
                }
            }
            catch
            {
                path = -1;
                return path;
            }
            return path;
        }
        public List<NHOM> getListNhom()
        {
            List<NHOM> lstNhom = db.NHOMs.ToList();
            return lstNhom;
        }
        public List<NHOMQUYEN> getListNhomQuyen()
        {
            List<NHOMQUYEN> lstNhomQuyen = db.NHOMQUYENs.ToList();
            return lstNhomQuyen;
        }
        public List<CHUCVU> getListChucVu()
        {
            List<CHUCVU> lstChucVu = db.CHUCVUs.ToList();
            return lstChucVu;
        }
       
        public ActionResult Delete_NhanSu(int id)
        {
            NHANSU nsu = db.NHANSUs.FirstOrDefault(x => x.MA_NS == id);
            db.NHANSUs.DeleteOnSubmit(nsu);
            db.SubmitChanges();
            return RedirectToAction("QL_NhanSu");
        }

        [HttpPost]
        public ActionResult Xoa_NhanSu(int mans)
        {
            int ma = mans;
            string ok = "YES";
            PHANCONG_BC_TV pc = db.PHANCONG_BC_TVs.FirstOrDefault(x => x.MA_NS == mans);
            if (pc != null)
            {
                ok = "NO";
            }
            else
            {
                NHANSU nsu = db.NHANSUs.FirstOrDefault(x => x.MA_NS == mans);
                if (nsu == null)
                {
                    ok = "NO";
                }
                else
                {
                    db.NHANSUs.DeleteOnSubmit(nsu);
                    db.SubmitChanges();
                }
            }
            var result = new { result = ok };
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Edit_NhanSu(string manhansu)
        {
            NHANSU item = db.NHANSUs.Where(x => x.MA_NS == int.Parse(manhansu)).FirstOrDefault();
            //NHANSU item = db.NHANSUs.FirstOrDefault(x => x.MA_NS == int.Parse(manhansu));
            ViewData["data"] = item;
            ViewData["lstNhom"] = getListNhom();
            ViewData["lstChucVu"] = getListChucVu();
            ViewData["lstNhomQuyen"] = getListNhomQuyen();
            return View();
        }
        [HttpPost]
        public ActionResult Edit_NhanSu(string TAIKHOAN, string MATKHAU, string selectionNhomQuyen, string TEN_NS, string MA_NS, string SDT, string GIOITINH, string EMAIL, DateTime NGAYSINH, string DIACHI, string selectionNhom, string selectionChucVu)
        {
            NHANSU itemEdit = db.NHANSUs.FirstOrDefault(x => x.MA_NS == int.Parse(MA_NS));
            if (itemEdit != null)
            {

                try
                {
                    itemEdit.TEN_NS = TEN_NS;
                    itemEdit.SDT = SDT;
                    itemEdit.GIOITINH = GIOITINH;
                    itemEdit.EMAIL = EMAIL;
                    itemEdit.NGAYSINH = NGAYSINH;
                    itemEdit.DIACHI = DIACHI;
                    itemEdit.TAIKHOAN = TAIKHOAN;
                    itemEdit.MATKHAU = MATKHAU;
                    itemEdit.MA_NQ = int.Parse(selectionNhomQuyen);
                    itemEdit.MA_NH = int.Parse(selectionNhom);
                   //
                    itemEdit.MA_CV = int.Parse(selectionChucVu);
                    db.SubmitChanges();
                    return RedirectToAction("QL_NhanSu");
                }
                catch (Exception ex)
                {
                    ViewData["Loi"] = "Khong sua duoc.";
                    return View();
                }

            }
            return View();
        }
        public ActionResult QL_CongViec()
        {
            List<PHANCONG_BC_TV> list = db.PHANCONG_BC_TVs.ToList();
            return View(list);
        }
        public ActionResult thongbao()
        {
            
            return View();
        }
       
        #endregion
        #region DanhGia
        public ActionResult DanhGia_BC()
        {
            return View();
        }
        public ActionResult DanhGia_BC_TC1()
        {
            List<TIEUCHUAN> list = db.TIEUCHUANs.ToList();
            return View(list);
        }
        public ActionResult DanhGia_BC_TC2(int id)
        {
            NHANSU ns = (NHANSU)Session["ns"];
            ViewBag.manh = ns.MA_NH;
            List<VW_TIEUCHI_TIEUCHUAN> list = new List<VW_TIEUCHI_TIEUCHUAN>();
            var data = from tieuchi in db.TIEUCHIs
                       join tieuchuan in db.TIEUCHUANs on tieuchi.MATIEUCHUAN equals tieuchuan.MATIEUCHUAN
                       where tieuchi.MATIEUCHUAN == id
                       select new { tieuchi.TIEUDETIEUCHI, tieuchi.MATIEUCHI, tieuchi.MATIEUCHUAN, tieuchuan.TIEUDETIEUCHUAN, tieuchi.DUONGDAN_ND };
            if (data != null)
            {
                foreach (var item in data)
                {
                    VW_TIEUCHI_TIEUCHUAN itemTC = new VW_TIEUCHI_TIEUCHUAN();
                    itemTC.MATIEUCHI = item.MATIEUCHI;
                    itemTC.MATIEUCHUAN = item.MATIEUCHUAN;
                    itemTC.TIEUDETIEUCHI = item.TIEUDETIEUCHI;
                    itemTC.TIEUDETIEUCHUAN = item.TIEUDETIEUCHUAN;
                    itemTC.DUONGDAN_ND = item.DUONGDAN_ND;
                    list.Add(itemTC);
                }
            }
            ViewBag.matieuchuan = id;
            return View(list);
        }
        [HttpPost]
        public ActionResult DanhGia_BC_TC2(string DIEM, string GHICHU, DateTime NGAYDG, string MATIEUCHI)
        {
            NHANSU ns = (NHANSU)Session["ns"];
            KQ_DANHGIA_TIEUCHI kq4 = db.KQ_DANHGIA_TIEUCHIs.FirstOrDefault(x => x.MANDG == ns.MA_NS && x.MATIEUCHI == int.Parse(MATIEUCHI));
            if (kq4 != null)
            {
                return RedirectToAction("DanhGia_BC_TC1");
            }
            else
            {
                KQ_DANHGIA_TIEUCHI newItem = new KQ_DANHGIA_TIEUCHI();
                if (DIEM == "")
                {
                    newItem.DIEM_DG = null;
                }
                else
                {
                    newItem.DIEM_DG = int.Parse(DIEM);
                }
                newItem.GHICHU = GHICHU;
                newItem.NGAYDG = NGAYDG;
                newItem.MANDG = ns.MA_NS;
                newItem.MATIEUCHI = int.Parse(MATIEUCHI);
                db.KQ_DANHGIA_TIEUCHIs.InsertOnSubmit(newItem);
                db.SubmitChanges();


                return RedirectToAction("DanhGia_BC_TC2");
            }

        }
        [HttpGet]
        public ActionResult DanhGia_P1()
        {
            NHANSU ns = (NHANSU)Session["ns"];
            ViewBag.manh = ns.MA_NH;
            return View();
        }
        [HttpPost]
        public ActionResult DanhGia_P1( string DIEM, string GHICHU, DateTime NGAYDG)
        {
            NHANSU ns = (NHANSU)Session["ns"];
            KQ_DANHGIA_PHAN1 kq1 = db.KQ_DANHGIA_PHAN1s.FirstOrDefault(x => x.MANDG == ns.MA_NS);
            if (kq1 != null)
            {
                return View();
            }
            else 
            {
                KQ_DANHGIA_PHAN1 newItem = new KQ_DANHGIA_PHAN1();
                if (DIEM == "")
                {
                    newItem.DIEM_DG = null;
                }
                else
                {
                    newItem.DIEM_DG = int.Parse(DIEM);
                }
                newItem.GHICHU = GHICHU;
                newItem.NGAYDG = NGAYDG;
                newItem.MANDG = ns.MA_NS;
                db.KQ_DANHGIA_PHAN1s.InsertOnSubmit(newItem);
                db.SubmitChanges();
                return RedirectToAction("DanhGia_P1");
            }

        }
        [HttpGet]
        public ActionResult DanhGia_P3()
        {
            NHANSU ns = (NHANSU)Session["ns"];
            ViewBag.manh = ns.MA_NH;
            return View();
        }
        [HttpPost]
        public ActionResult DanhGia_P3(string DIEM, string GHICHU, DateTime NGAYDG)
        {

            NHANSU ns = (NHANSU)Session["ns"];
            KQ_DANHGIA_PHAN3 kq2 = db.KQ_DANHGIA_PHAN3s.FirstOrDefault(x => x.MANDG == ns.MA_NS);
            if (kq2 != null)
            {
                return View();
            }
            else
            {
                KQ_DANHGIA_PHAN3 newItem = new KQ_DANHGIA_PHAN3();
                if (DIEM == "")
                {
                    newItem.DIEM_DG = null;
                }
                else
                {
                    newItem.DIEM_DG = int.Parse(DIEM);
                }
                newItem.GHICHU = GHICHU;
                newItem.NGAYDG = NGAYDG;
                newItem.MANDG = ns.MA_NS;
                db.KQ_DANHGIA_PHAN3s.InsertOnSubmit(newItem);
                db.SubmitChanges();


                return RedirectToAction("DanhGia_P3");
            }
        }
        [HttpGet]
        public ActionResult DanhGia_P4()
        {
            NHANSU ns = (NHANSU)Session["ns"];
            ViewBag.manh = ns.MA_NH;
            return View();
        }
        [HttpPost]
        public ActionResult DanhGia_P4(string DIEM, string GHICHU, DateTime NGAYDG)
        {
            NHANSU ns = (NHANSU)Session["ns"];
            KQ_DANHGIA_PHAN4 kq3 = db.KQ_DANHGIA_PHAN4s.FirstOrDefault(x => x.MANDG == ns.MA_NS);
            if (kq3 != null)
            {
                return View();
            }
            else
            {
                KQ_DANHGIA_PHAN4 newItem = new KQ_DANHGIA_PHAN4();
                if (DIEM == "")
                {
                    newItem.DIEM_DG = null;
                }
                else
                {
                    newItem.DIEM_DG = int.Parse(DIEM);
                }
                newItem.GHICHU = GHICHU;
                newItem.NGAYDG = NGAYDG;
                newItem.MANDG = ns.MA_NS;
                db.KQ_DANHGIA_PHAN4s.InsertOnSubmit(newItem);
                db.SubmitChanges();


                return RedirectToAction("DanhGia_P4");
            }
        }
        public ActionResult thongke_DG()
        {
            NHANSU ns = (NHANSU)Session["ns"];
            if (ns.MA_NQ == 1)
            {
                var thongke_phan1 = db.KQ_DANHGIA_PHAN1s.
                Select(x => new
                {
                    DanhGia = "Phần 1.Khái quát",
                    Diem = x.DIEM_DG.ToString(),
                    NoiDung = x.GHICHU,
                    MaNhanSu = x.MANDG,
                    TenNhanSu = db.NHANSUs.FirstOrDefault(y => y.MA_NS == x.MANDG).TEN_NS.ToString(),
                    NgayDG = x.NGAYDG.ToString(),
                    TinhTrang = (x.DIEM_DG >= 4) ? "Đạt" : "Chưa đạt",
                    MaNhom = db.NHANSUs.FirstOrDefault(y => y.MA_NS == x.MANDG).MA_NH,
                }).ToList();
                var thongke_phan3 = db.KQ_DANHGIA_PHAN3s.
                    Select(x => new
                    {
                        DanhGia = "Phần 3.Kết luận",
                        Diem = x.DIEM_DG.ToString(),
                        NoiDung = x.GHICHU,
                        MaNhanSu = x.MANDG,
                        TenNhanSu = db.NHANSUs.FirstOrDefault(y => y.MA_NS == x.MANDG).TEN_NS.ToString(),
                        NgayDG = x.NGAYDG.ToString(),
                        TinhTrang = (x.DIEM_DG >= 4) ? "Đạt" : "Chưa đạt",
                        MaNhom = db.NHANSUs.FirstOrDefault(y => y.MA_NS == x.MANDG).MA_NH,
                    }).ToList();
                var thongke_phan4 = db.KQ_DANHGIA_PHAN4s.
                    Select(x => new
                    {
                        DanhGia = "Phần 4.Phụ Lục",
                        Diem = x.DIEM_DG.ToString(),
                        NoiDung = x.GHICHU,
                        MaNhanSu = x.MANDG,
                        TenNhanSu = db.NHANSUs.FirstOrDefault(y => y.MA_NS == x.MANDG).TEN_NS.ToString(),
                        NgayDG = x.NGAYDG.ToString(),
                        TinhTrang = (x.DIEM_DG >= 4) ? "Đạt" : "Chưa đạt",
                        MaNhom = db.NHANSUs.FirstOrDefault(y => y.MA_NS == x.MANDG).MA_NH,
                    }).ToList();
                var thongke_tieuchi = db.KQ_DANHGIA_TIEUCHIs.
                    Select(x => new
                    {
                        DanhGia = x.TIEUCHI.TIEUDETIEUCHI,
                        Diem = x.DIEM_DG.ToString(),
                        NoiDung = x.GHICHU,
                        MaNhanSu = x.MANDG,
                        TenNhanSu = db.NHANSUs.FirstOrDefault(y => y.MA_NS == x.MANDG).TEN_NS.ToString(),
                        NgayDG = x.NGAYDG.ToString(),
                        TinhTrang = (x.DIEM_DG >= 4) ? "Đạt" : "Chưa đạt",
                        MaNhom = db.NHANSUs.FirstOrDefault(y => y.MA_NS == x.MANDG).MA_NH,
                    }).ToList();
                thongke_phan1.AddRange(thongke_phan3);
                thongke_phan1.AddRange(thongke_phan4);
                thongke_phan1.AddRange(thongke_tieuchi);
                List<ThongKe> ds = new List<ThongKe>();
                foreach (var item in thongke_phan1)
                {
                    ThongKe i = new ThongKe(item.DanhGia, item.Diem, item.NoiDung, int.Parse(item.MaNhanSu.ToString()), item.TenNhanSu, item.NgayDG, item.TinhTrang, int.Parse(item.MaNhom.ToString()));
                    ds.Add(i);
                }
                var thongkediem_tungnhansu = ds.Where(x => x.MaNhom != 7).GroupBy(x => x.MaNhanSu).
                    Select(x => new { 
                        MaNhanSu = x.Key,
                        TenNhanSu = ds.Find(y => y.MaNhanSu == x.Key).TenNhanSu,
                        Diem = x.Where(y => y.Diem != null).Sum(z => float.Parse(z.Diem)) / x.Where(y => y.Diem != null).Count(),
                        SoLanDat = x.Where(y => y.TinhTrang.Equals("Đạt")).Count(),
                        SoLanChuaDat = x.Where(y => y.TinhTrang.Equals("Chưa đạt")).Count(),
                    });
                List<ThongKe_Admin> dsTK = new List<ThongKe_Admin>();
                foreach (var item in thongkediem_tungnhansu)
                {
                    ThongKe_Admin i = new ThongKe_Admin(item.MaNhanSu, item.TenNhanSu, item.Diem, item.SoLanDat, item.SoLanChuaDat);
                    dsTK.Add(i);
                }
                ViewBag.dsTK = dsTK;
                ds = ds.OrderBy(x => x.MaNhanSu).ToList();
                return View(ds);
            }
            else
            {
                var thongke_phan1 = db.KQ_DANHGIA_PHAN1s.
                    Where(x => x.MANDG == ns.MA_NS).
                    Select(x => new
                    {
                        DanhGia = "Phần 1.Khái quát",
                        Diem = x.DIEM_DG.ToString(),
                        NoiDung = x.GHICHU,
                        MaNhanSu = ns.MA_NS,
                        TenNhanSu = ns.TEN_NS,
                        NgayDG = x.NGAYDG.ToString(),
                        TinhTrang = (x.DIEM_DG >= 4) ? "Đạt" : "Chưa đạt",
                        MaNhom = db.NHANSUs.FirstOrDefault(y => y.MA_NS == ns.MA_NS).MA_NH,
                    }).ToList();
                var thongke_phan3 = db.KQ_DANHGIA_PHAN3s.
                    Where(x => x.MANDG == ns.MA_NS).
                    Select(x => new
                    {
                        DanhGia = "Phần 3.Kết luận",
                        Diem = x.DIEM_DG.ToString(),
                        NoiDung = x.GHICHU,
                        MaNhanSu = ns.MA_NS,
                        TenNhanSu = ns.TEN_NS,
                        NgayDG = x.NGAYDG.ToString(),
                        TinhTrang = (x.DIEM_DG >= 4) ? "Đạt" : "Chưa đạt",
                        MaNhom = db.NHANSUs.FirstOrDefault(y => y.MA_NS == ns.MA_NS).MA_NH,
                    }).ToList();
                var thongke_phan4 = db.KQ_DANHGIA_PHAN4s.
                    Where(x => x.MANDG == ns.MA_NS).
                    Select(x => new
                    {
                        DanhGia = "Phần 4.Phụ Lục",
                        Diem = x.DIEM_DG.ToString(),
                        NoiDung = x.GHICHU,
                        MaNhanSu = ns.MA_NS,
                        TenNhanSu = ns.TEN_NS,
                        NgayDG = x.NGAYDG.ToString(),
                        TinhTrang = (x.DIEM_DG >= 4) ? "Đạt" : "Chưa đạt",
                        MaNhom = db.NHANSUs.FirstOrDefault(y => y.MA_NS == ns.MA_NS).MA_NH,
                    }).ToList();
                var thongke_tieuchi = db.KQ_DANHGIA_TIEUCHIs.
                    Where(x => x.MANDG == ns.MA_NS).
                    Select(x => new
                    {
                        DanhGia = x.TIEUCHI.TIEUDETIEUCHI,
                        Diem = x.DIEM_DG.ToString(),
                        NoiDung = x.GHICHU,
                        MaNhanSu = ns.MA_NS,
                        TenNhanSu = ns.TEN_NS,
                        NgayDG = x.NGAYDG.ToString(),
                        TinhTrang = (x.DIEM_DG >= 4) ? "Đạt" : "Chưa đạt",
                        MaNhom = db.NHANSUs.FirstOrDefault(y => y.MA_NS == ns.MA_NS).MA_NH,
                    }).ToList();
                thongke_phan1.AddRange(thongke_phan3);
                thongke_phan1.AddRange(thongke_phan4);
                thongke_phan1.AddRange(thongke_tieuchi);
                List<ThongKe> ds = new List<ThongKe>();
                int dem = 0;
                if (ns.MA_NH == 7)
                {
                    foreach (var item in thongke_phan1)
                    {
                        ThongKe i = new ThongKe(item.DanhGia, item.Diem, item.NoiDung, int.Parse(item.MaNhanSu.ToString()), item.TenNhanSu, item.NgayDG, item.TinhTrang, int.Parse(item.MaNhom.ToString()));
                        ds.Add(i);
                    }
                }
                else
                {
                    float diem = 0;
                    int solandat = 0;
                    int solanchuadat = 0;
                    foreach (var item in thongke_phan1)
                    {
                        ThongKe i = new ThongKe(item.DanhGia, item.Diem, item.NoiDung, int.Parse(item.MaNhanSu.ToString()), item.TenNhanSu, item.NgayDG, item.TinhTrang, int.Parse(item.MaNhom.ToString()));
                        ds.Add(i);
                        diem += float.Parse(item.Diem);
                        ++dem;
                        if (item.TinhTrang.Equals("Đạt")) ++solandat;
                        if (item.TinhTrang.Equals("Chưa đạt")) ++solanchuadat;
                    }
                    ViewBag.tbdiem = diem / dem;
                    ViewBag.solandat = solandat;
                    ViewBag.solanchuadat = solanchuadat;
                }
                return View(ds);
            }
        }
        #endregion
        #region KiemDuyet
        public ActionResult KiemDuyet_TC()
        {
            List<TIEUCHUAN> list = db.TIEUCHUANs.ToList();
            return View(list);
        }
        public ActionResult KiemDuyet_TC2(int id)
        {
            List<VW_TIEUCHI_TIEUCHUAN> list = new List<VW_TIEUCHI_TIEUCHUAN>();
            var data = from tieuchi in db.TIEUCHIs
                       join tieuchuan in db.TIEUCHUANs on tieuchi.MATIEUCHUAN equals tieuchuan.MATIEUCHUAN
                       where tieuchi.MATIEUCHUAN == id
                       select new { tieuchi.TIEUDETIEUCHI, tieuchi.MATIEUCHI, tieuchi.MATIEUCHUAN, tieuchuan.TIEUDETIEUCHUAN, tieuchi.DUONGDAN_ND };
            if (data != null)
            {
                foreach (var item in data)
                {
                    VW_TIEUCHI_TIEUCHUAN itemTC = new VW_TIEUCHI_TIEUCHUAN();
                    itemTC.MATIEUCHI = item.MATIEUCHI;
                    itemTC.MATIEUCHUAN = item.MATIEUCHUAN;
                    itemTC.TIEUDETIEUCHI = item.TIEUDETIEUCHI;
                    itemTC.TIEUDETIEUCHUAN = item.TIEUDETIEUCHUAN;
                    itemTC.DUONGDAN_ND = item.DUONGDAN_ND;
                    list.Add(itemTC);
                }
            }
            ViewBag.matieuchuan = id;
            return View(list);
        }
        [HttpPost]
        public ActionResult KiemDuyet_TC2(int id, string TINHTRANG, string GHICHU, DateTime NGAYKD, string ckbduyet, string MATIEUCHI)
        {
            KQ_KIEMDUYET_TIEUCCHI kd = new KQ_KIEMDUYET_TIEUCCHI();
            if (ckbduyet != null)
            {
                kd.TINHTRANG = ckbduyet;
            }
            else
            {
                kd.TINHTRANG = "CHƯA DUYỆT";
            }

            kd.GHICHU = GHICHU;
            kd.NGAYKD = NGAYKD;
            kd.MATIEUCHI = int.Parse(MATIEUCHI);
            db.KQ_KIEMDUYET_TIEUCCHIs.InsertOnSubmit(kd);
            db.SubmitChanges();
            return RedirectToAction("KiemDuyet_TC2/" + id);
        }

        public ActionResult Cbbox_CauTruc() {
            List<DuongDan> ds = new List<DuongDan>();
            ds.Add(new DuongDan("KiemDuyet_P1", "Phần 1. Khái quát"));
            ds.Add(new DuongDan("KiemDuyet_TC", "Phần 2. Tự đánh giá"));
            ds.Add(new DuongDan("KiemDuyet_P3", "Phần 3. Kết luận"));
            ds.Add(new DuongDan("KiemDuyet_P4", "Phần 4. Phụ lục"));
            return PartialView(ds);
        }

        public ActionResult KiemDuyet_P1()
        {
            return View();
        }
        [HttpPost]
        public ActionResult KiemDuyet_P1(string TINHTRANG, string GHICHU, DateTime NGAYKD, string ckbduyet)
        {
            KQ_KIEMDUYET_PHAN1 kd = new KQ_KIEMDUYET_PHAN1();
            if (ckbduyet != null)
            {
                kd.TINHTRANG = ckbduyet;
            }
            else
            {
                kd.TINHTRANG = "CHƯA DUYỆT";
            }


            kd.GHICHU = GHICHU;
            kd.NGAYKD = NGAYKD;

            db.KQ_KIEMDUYET_PHAN1s.InsertOnSubmit(kd);
            db.SubmitChanges();
            return View();
        }
        public ActionResult KiemDuyet_P3()
        {
            return View();
        }
        [HttpPost]
        public ActionResult KiemDuyet_P3(string TINHTRANG, string GHICHU, DateTime NGAYKD, string ckbduyet)
        {
            KQ_KIEMDUYET_PHAN3 kd = new KQ_KIEMDUYET_PHAN3();
            if (ckbduyet != null)
            {
                kd.TINHTRANG = ckbduyet;
            }
            else
            {
                kd.TINHTRANG = "CHƯA DUYỆT";
            }


            kd.GHICHU = GHICHU;
            kd.NGAYKD = NGAYKD;

            db.KQ_KIEMDUYET_PHAN3s.InsertOnSubmit(kd);
            db.SubmitChanges();
            return View();
        }
        public ActionResult KiemDuyet_P4()
        {
            return View();
        }
        [HttpPost]
        public ActionResult KiemDuyet_P4(string TINHTRANG, string GHICHU, DateTime NGAYKD, string ckbduyet)
        {
            KQ_KIEMDUYET_PHAN4 kd = new KQ_KIEMDUYET_PHAN4();
            if (ckbduyet != null)
            {
                kd.TINHTRANG = ckbduyet;
            }
            else
            {
                kd.TINHTRANG = "CHƯA DUYỆT";
            }


            kd.GHICHU = GHICHU;
            kd.NGAYKD = NGAYKD;

            db.KQ_KIEMDUYET_PHAN4s.InsertOnSubmit(kd);
            db.SubmitChanges();
            return View();
        }
        #endregion
        #region QL_HS
        public ActionResult TieuChuanTieuChiMinhChung(string matieuchi)
        {
            List<VW_TIEUCHI_MINHCHUNG> list = new List<VW_TIEUCHI_MINHCHUNG>();

            var data = from minhchung in db.MINHCHUNGs
                       join tieuchi in db.TIEUCHIs on minhchung.MATIEUCHI equals tieuchi.MATIEUCHI
                       where int.Parse(matieuchi) == minhchung.MATIEUCHI
                       select new { minhchung.TENMINHCHUNG, minhchung.MAMINHCHUNG, minhchung.MATIEUCHI };
            if (data != null)
            {
                foreach (var item in data)
                {
                    VW_TIEUCHI_MINHCHUNG itemMC = new VW_TIEUCHI_MINHCHUNG();
                    itemMC.MAMINHCHUNG = item.MAMINHCHUNG;
                    itemMC.MATIEUCHI = item.MATIEUCHI;
                    itemMC.TENMINHCHUNG = item.TENMINHCHUNG;
                    list.Add(itemMC);
                }
            }
            return View(list);
        }

        public ActionResult DM_BaoCao()
        {
            return View();
        }

        public ActionResult QLHS_P1()
        {
            ViewData["listDG_1"] = getListDanhGia_P1();
            ViewData["listKD_1"] = getListKiemDuyet_P1();
            return View();
            
        }
        public List<KQ_DANHGIA_PHAN1> getListDanhGia_P1()
        {
            List<KQ_DANHGIA_PHAN1> listDG_1 = db.KQ_DANHGIA_PHAN1s.ToList();
            return listDG_1;
        }
        public List<KQ_KIEMDUYET_PHAN1> getListKiemDuyet_P1()
        {
            List<KQ_KIEMDUYET_PHAN1> listKD_1 = db.KQ_KIEMDUYET_PHAN1s.ToList();
            return listKD_1;
        }
        public ActionResult QLHS_P3()
        {
            ViewData["listDG_3"] = getListDanhGia_P3();
            ViewData["listKD_3"] = getListKiemDuyet_P3();
            return View();
        }
        public List<KQ_DANHGIA_PHAN3> getListDanhGia_P3()
        {
            List<KQ_DANHGIA_PHAN3> listDG_3 = db.KQ_DANHGIA_PHAN3s.ToList();
            return listDG_3;
        }
        public List<KQ_KIEMDUYET_PHAN3> getListKiemDuyet_P3()
        {
            List<KQ_KIEMDUYET_PHAN3> listKD_3 = db.KQ_KIEMDUYET_PHAN3s.ToList();
            return listKD_3;
        }
        public ActionResult QLHS_P4()
        {
            ViewData["listDG_4"] = getListDanhGia_P4();
            ViewData["listKD_4"] = getListKiemDuyet_P4();
            return View();
        }
        public List<KQ_DANHGIA_PHAN4> getListDanhGia_P4()
        {
            List<KQ_DANHGIA_PHAN4> listDG_4 = db.KQ_DANHGIA_PHAN4s.ToList();
            return listDG_4;
        }
        public List<KQ_KIEMDUYET_PHAN4> getListKiemDuyet_P4()
        {
            List<KQ_KIEMDUYET_PHAN4> listKD_4 = db.KQ_KIEMDUYET_PHAN4s.ToList();
            return listKD_4;
        }
        public ActionResult DM_TieuChuan()
        {
            List<TIEUCHUAN> list = db.TIEUCHUANs.ToList();
            return View(list);
        }
        public ActionResult DM_TieuChi(string matieuchuan)
        {
            List<VW_TIEUCHI_TIEUCHUAN> list = new List<VW_TIEUCHI_TIEUCHUAN>();

            var data = from tieuchi in db.TIEUCHIs
                       join tieuchuan in db.TIEUCHUANs on tieuchi.MATIEUCHUAN equals tieuchuan.MATIEUCHUAN
                       where int.Parse(matieuchuan) == tieuchi.MATIEUCHUAN
                       select new { tieuchi.TIEUDETIEUCHI, tieuchi.MATIEUCHI, tieuchi.MATIEUCHUAN, tieuchuan.TIEUDETIEUCHUAN, tieuchi.DUONGDAN_ND };
            if (data != null)
            {
                foreach (var item in data)
                {
                    VW_TIEUCHI_TIEUCHUAN itemTC = new VW_TIEUCHI_TIEUCHUAN();
                    itemTC.MATIEUCHI = item.MATIEUCHI;
                    itemTC.MATIEUCHUAN = item.MATIEUCHUAN;
                    itemTC.TIEUDETIEUCHI = item.TIEUDETIEUCHI;
                    itemTC.TIEUDETIEUCHUAN = item.TIEUDETIEUCHUAN;
                    itemTC.DUONGDAN_ND = item.DUONGDAN_ND;
                    list.Add(itemTC);
                }
            }
            return View(list);

        }
        public ActionResult BC_DanhGia()
        {
            return View();
        }
        public ActionResult Phan1()
        {
            return View();
        }
        public ActionResult Phan2()
        {
            return View();
        }
        public ActionResult Phan3()
        {
            return View();
        }
        public ActionResult Phan4()
        {
            return View();
        }
        #endregion
        #region PhanCong
        public ActionResult PhanCong_Nhom()
        {
            List<PHANCONG_BC_TV> list = db.PHANCONG_BC_TVs.ToList();
            //var data = from nhansu in db.NHANSUs
            //           join nhom in db.NHOMs on nhansu.MA_NH equals nhom.MA_NH
            //           where nhansu.MA_NH == id
            //           select new { nhansu.MA_NS, nhansu.TEN_NS, nhom.MA_NH};
            //ViewBag.manhom = id;
            return View(list);
        }

        

        public ActionResult Select_TieuChi(int noidung)
        {
            List<TIEUCHI> ds = db.TIEUCHIs.Where(x => x.MATIEUCHUAN == noidung).ToList();
            string ok = "YES";
            char c = '"';
            string option = "<option value hiden>-- Chọn tiêu chí --</option>";
            if (ds == null) ok = "NO";
            else
            {
                foreach (TIEUCHI item in ds)
                {
                    option += "<option value=" + c + item.TIEUDETIEUCHI + c + "> " + item.TIEUDETIEUCHI + " </option>";
                }
            }
            var json = new {ok = ok, result = option};
            return Json(json, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult Create_PhanCong(int mabaocao, string kihieu)
        {

            //ViewData["lstNhom"] = getListNhom();
            //ViewData["lstNhanSu"] = getListNhanSu1();
            //ViewData["lstNhanSu"] = getListNhanSuHD();
            ViewData["lstNhom"] = getListNhomPC();
            ViewData["lstPhanBC"] = getListPhanBC(mabaocao);

            List<NHANSU> dsNS = db.NHANSUs.Where(x => x.NHOM.KYHIEU.Equals(kihieu)).ToList();
            ViewData["lstNhanSu"] = dsNS;

            ViewBag.mabaocao = mabaocao;
            //ViewData["lstHoso"] = hoso(mabaocao);
            if (mabaocao == 1)
            {
                ViewData["khaiquat"] = db.P1_KHAIQUATs.Where(x => x.MABAOCAO == mabaocao).ToList();
            }
            else if (mabaocao == 2)
            {
                ViewData["danhgia"] = db.P2_DANHGIAs.Where(x => x.MABAOCAO == mabaocao).ToList();
            }
            else if (mabaocao == 3)
            {
                ViewData["ketluan"] = db.P3_KETLUANs.Where(x => x.MABAOCAO == mabaocao).ToList();
            }
            else if (mabaocao == 4)
            {
                ViewData["phuluc"] = db.P4_PHULUCs.Where(x => x.MABAOCAO == mabaocao).ToList();
            }
            
            return View();
        }

        //public ActionResult DanhSachNhiemVu(int mans)
        //{
        //    var a = mans;
        //    var data = new { status = "ok", result = mans };
        //    return Json(data, JsonRequestBehavior.AllowGet);
        //}

        [HttpPost]
        public ActionResult Create_PhanCong(int mabaocao, string selectionTieuChi, string selectionNhanSu,string selectionNoiDung,  DateTime NGAYPHANCONG, DateTime THOIHAN)
        {
            PHANCONG_BC_TV newItem = new PHANCONG_BC_TV();
           
            //newItem.NHANSU.NHOM.MA_NH = int.Parse(selectionNhom);
            newItem.MA_NS = int.Parse(selectionNhanSu);
            newItem.NOIDUNG_PC = selectionNoiDung;
            newItem.NGAYPHANCONG = NGAYPHANCONG;
            newItem.THOIHAN = THOIHAN;
            newItem.MABAOCAO = mabaocao;
            if (mabaocao == 2)
            {
                newItem.NOIDUNG_PC = selectionTieuChi;
            }
            else { newItem.NOIDUNG_PC = selectionNoiDung; }
            db.PHANCONG_BC_TVs.InsertOnSubmit(newItem);
            db.SubmitChanges();
            return RedirectToAction("PhanCong_Nhom");

        }
        //public JsonResult getListNhanSu(NHOM nh)
        //{
        //    List<NHANSU> lstNhanSu = db.NHANSUs.Where(x => x.MA_NH == nh.MA_NH).ToList();
        //    return Json("true", JsonRequestBehavior.AllowGet);
        //}
        public List<NHANSU> getListNhanSu1()
        {
            List<NHANSU> lstNhanSu = db.NHANSUs.Where(x=>x.NHOM.KYHIEU == "bc").ToList();
            return lstNhanSu;
        }
        public List<NHANSU> getListNhanSuHD()
        {
            List<NHANSU> lstNhanSu = db.NHANSUs.Where(x => x.NHOM.KYHIEU == "hd").ToList();
            return lstNhanSu;
        }
        public JsonResult addNhanSu(NHANSU ns) {
            return Json("true", JsonRequestBehavior.AllowGet);
        }
     
        public ActionResult Delete_PhanCong(int id)
        {
            PHANCONG_BC_TV pc = db.PHANCONG_BC_TVs.FirstOrDefault(x => x.MAPHANCONG_TV == id);
            db.PHANCONG_BC_TVs.DeleteOnSubmit(pc);
            db.SubmitChanges();
            return RedirectToAction("PhanCong_Nhom");
        }
        public ActionResult Edit_PhanCong(string maphancong)
        {
            PHANCONG_BC_TV item = db.PHANCONG_BC_TVs.Where(x => x.MAPHANCONG_TV == int.Parse(maphancong)).FirstOrDefault();
            //NHANSU item = db.NHANSUs.FirstOrDefault(x => x.MA_NS == int.Parse(manhansu));
            ViewData["data"] = item;
            ViewData["lstNhanSu"] = getListNhanSu1();
            return View();
        }
        [HttpPost]
        public ActionResult Edit_PhanCong(string MAPHANCONG,string selectionNhanSu, string selectionNoiDung, DateTime NGAYPHANCONG, DateTime THOIHAN)
        {
            PHANCONG_BC_TV itemEdit = db.PHANCONG_BC_TVs.FirstOrDefault(x => x.MAPHANCONG_TV == int.Parse(MAPHANCONG));
            if (itemEdit != null)
            {

                try
                {
                    itemEdit.MA_NS = int.Parse(selectionNhanSu);
                    itemEdit.NOIDUNG_PC = selectionNoiDung;
                    itemEdit.NGAYPHANCONG = NGAYPHANCONG;
                    itemEdit.THOIHAN = THOIHAN;
                    db.SubmitChanges();
                    return RedirectToAction("PhanCong_Nhom");
                }
                catch (Exception ex)
                {
                    ViewData["Loi"] = "Khong sua duoc.";
                    return View();
                }

            }
            return View();
        }
        ////////////////
        //public ActionResult PhanCong_BC()
        //{
        //    List<PHANCONG_BC_NH> list = db.PHANCONG_BC_NHs.ToList();
        //    //var data = from nhansu in db.NHANSUs
        //    //           join nhom in db.NHOMs on nhansu.MA_NH equals nhom.MA_NH
        //    //           where nhansu.MA_NH == id
        //    //           select new { nhansu.MA_NS, nhansu.TEN_NS, nhom.MA_NH};
        //    //ViewBag.manhom = id;
        //    return View(list);
        //}

        //public ActionResult Create_PhanCongNH(int mabaocao)
        //{
        //    ViewData["lstNhom"] = getListNhomPC();
        //    ViewData["lstPhanBC"] = getListPhanBC(mabaocao);

        //    ViewBag.mabaocao = mabaocao;
        //    //ViewData["lstHoso"] = hoso(mabaocao);
        //    if (mabaocao == 1)
        //    {
        //        ViewData["khaiquat"] = db.P1_KHAIQUATs.Where(x => x.MABAOCAO == mabaocao).ToList();
        //    }
        //    else if (mabaocao == 2)
        //    {
        //        ViewData["danhgia"] = db.P2_DANHGIAs.Where(x => x.MABAOCAO == mabaocao).ToList();
        //    }
        //    else if (mabaocao == 3)
        //    {
        //        ViewData["ketluan"] = db.P3_KETLUANs.Where(x => x.MABAOCAO == mabaocao).ToList();
        //    }
        //    else if (mabaocao == 4)
        //    {
        //        ViewData["phuluc"] = db.P4_PHULUCs.Where(x => x.MABAOCAO == mabaocao).ToList();
        //    }
        //    ViewBag.mabaocao = mabaocao;
        //    return View();
        //}

        //[HttpPost]
        //public ActionResult Create_PhanCongNH(int mabaocao, string selectionNhom, string selectionPhanBC, DateTime NGAYPHANCONG, DateTime THOIHAN)
        //{
           
        //        PHANCONG_BC_NH newItem = new PHANCONG_BC_NH();


        //        //newItem.NHANSU.NHOM.MA_NH = int.Parse(selectionNhom);
        //        newItem.MA_NH = int.Parse(selectionNhom);
        //        newItem.NOIDUNG_PC = selectionPhanBC;
        //        newItem.NGAYPHANCONG = NGAYPHANCONG;
        //        newItem.THOIHAN = THOIHAN;
        //        newItem.MABAOCAO = mabaocao;
        //        db.PHANCONG_BC_NHs.InsertOnSubmit(newItem);
        //        db.SubmitChanges();
           

        //    return RedirectToAction("PhanCong_BC");
        //}
        protected string tdate { get; set; }

        public List<NHOM> getListNhomPC()
        {

            List<NHOM> lstNhom = db.NHOMs.Where(x => x.KYHIEU == "bc").ToList();
            return lstNhom;
        }
        public List<HOSOBC> getListPhanBC(int mabaocao)
        {

            List<HOSOBC> lstPhanBC = db.HOSOBCs.Where(x => x.MABAOCAO == mabaocao).ToList();
            return lstPhanBC;
        }
        public HOSOBC hoso(int mabaocao)
        {
            HOSOBC lstHoso = db.HOSOBCs.FirstOrDefault(x => x.MABAOCAO == mabaocao);
            return lstHoso;
        }
        public ActionResult select_Phan()
        {
            List<HOSOBC> list = db.HOSOBCs.ToList();
            return View(list);
        }
        public ActionResult select_Phan_TV()
        {
            List<HOSOBC> list = db.HOSOBCs.ToList();
            return View(list);
        }
        public List<P1_KHAIQUAT> getListPhan1(int mabaocao)
        {

            List<P1_KHAIQUAT> lstPhan1 = db.P1_KHAIQUATs.Where(x => x.MABAOCAO == mabaocao).ToList();
            return lstPhan1;
        }
        public List<P2_DANHGIA> getListPhan2(int mabaocao)
        {

            List<P2_DANHGIA> lstPhan2 = db.P2_DANHGIAs.Where(x => x.MABAOCAO == mabaocao).ToList();
            return lstPhan2;
        }
        public List<P3_KETLUAN> getListPhan3(int mabaocao)
        {

            List<P3_KETLUAN> lstPhan3 = db.P3_KETLUANs.Where(x => x.MABAOCAO == mabaocao).ToList();
            return lstPhan3;
        }
        public List<P4_PHULUC> getListPhan4(int mabaocao)
        {

            List<P4_PHULUC> lstPhan4 = db.P4_PHULUCs.Where(x => x.MABAOCAO == mabaocao).ToList();
            return lstPhan4;
        }
        //public ActionResult Delete_PhanCongNH(int id)
        //{
        //    PHANCONG_BC_NH pcNH = db.PHANCONG_BC_NHs.FirstOrDefault(x => x.MAPHANCONG_NH == id);
        //    db.PHANCONG_BC_NHs.DeleteOnSubmit(pcNH);
        //    db.SubmitChanges();
        //    return RedirectToAction("PhanCong_BC");
        //}
        #endregion
        public ActionResult doi_MK(string manhansu)
        {
            
            NHANSU item = db.NHANSUs.Where(x => x.MA_NS == int.Parse(manhansu)).FirstOrDefault();
            
            ViewData["data"] = item;
            return View();
        }
        
        [HttpPost]
        public ActionResult doi_MK(string MATKHAU, string MA_NS)
        {
            NHANSU itemEdit = db.NHANSUs.FirstOrDefault(x => x.MA_NS == int.Parse(MA_NS));
            if (itemEdit != null)
            {

                try
                {
                    itemEdit.MATKHAU = MATKHAU;
                    db.SubmitChanges();
                    return RedirectToAction("Login");
                }
                catch (Exception ex)
                {
                    ViewData["Loi"] = "Khong sua duoc.";
                    return View();
                }

            }
            return View();
        }
    }
}