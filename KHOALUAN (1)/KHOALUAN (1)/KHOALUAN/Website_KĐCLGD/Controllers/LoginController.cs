using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Website_KĐCLGD.Models;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace Website_KĐCLGD.Controllers
{
    public class LoginController : Controller
    {
        //
        // GET: /Login/
        SqlConnection con = new SqlConnection();
        SqlCommand com = new SqlCommand();
        SqlDataReader dr;
        DB_KDCLDataContext db = new DB_KDCLDataContext();
        public ActionResult Index()
        {
            var list = db.NHANSUs;

            return View(list.ToList());
        }

        public ActionResult Login()
        {
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string username, string password)
        {
            Session["ns"] = null;
            if (ModelState.IsValid)
            {

                NHANSU data = db.NHANSUs.FirstOrDefault(s => s.TAIKHOAN.Equals(username) && s.MATKHAU.Equals(password));
                if (data != null)
                {
                    //add session
                    Session["ns"] = data;
                    if (data.MA_NQ == 1)
                        return RedirectToAction("QL_Nhansu", "Website_KĐCLGD");
                    else if (data.MA_NQ == 2)
                        return RedirectToAction("QLHS_P1", "Website_KĐCLGD");
                    else if (data.MA_NQ == 3)
                        return RedirectToAction("QL_Nhansu", "Website_KĐCLGD");
                    else if (data.MA_NQ == 4)
                        return RedirectToAction("KiemDuyet_P1", "Website_KĐCLGD");
                    else if (data.MA_NQ == 5)
                        return RedirectToAction("DanhGia_P1", "Website_KĐCLGD");
                }
                else
                {
                    ViewBag.error = "<script>alert('Tài khoản hoặc mật khẩu không đúng.')</script>";
                    return View();
                }
            }
            return View();
        }

        public ActionResult ThayDoiNguoiDung()
        {
            NHANSU nd = (NHANSU)Session["ns"];

            return PartialView(nd);
        }

        public ActionResult ChuyenChucNang()
        {
            NHANSU ns = (NHANSU)Session["ns"];
           
            return PartialView(ns);
        }

        public ActionResult PhanQuyen()
        {
            if (Session["ns"] == null)
            {
                return RedirectToAction("Login", "Login");
            }
            else
            {
                NHANSU ns = (NHANSU)Session["ns"];

                return PartialView(ns);
            }
        }

        public ActionResult DangXuat()
        {
            Session["ns"] = null;
            return RedirectToAction("Index", "Website_KĐCLGD");
        }

        //
        // GET: /Login/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Login/Create

        public ActionResult Create()
        {
            return View();
        }

        //


        //create a string MD5
        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");

            }
            return byte2String;
        }
        // POST: /Login/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        //public ActionResult Create([Bind(Include = "MA_ND,TEN_ND,MATKHAU,MA_NQ")] NHANSU ns)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.NGUOIDUNGs.InsertOnSubmit(nGUOIDUNG);
        //        db.SubmitChanges();
        //        return RedirectToAction("Index");


        //    }
        //    return View(nGUOIDUNG);

        //}

        //
        // GET: /Login/Edit/5

        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Login/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Login/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Login/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
