using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCYeni.Models.EntityFramework;



namespace MVCYeni.Controllers
{
    public class ProductsController : Controller
    {
        // GET: Products
        KoyuncuEntities db = new KoyuncuEntities();
        public ActionResult Index()
        {
            var model = db.Products.ToList();
            return View(model);
        }
        [HttpGet]//Veriyi okuma öz nitelik
        public ActionResult Yeni()
        {
            return View("ProductsForm");
        }
        [HttpPost]//Veriyi okuma öz nitelik
        public ActionResult Kaydet(Products pro)
            
        {

            if(pro.ProductID==0)//id =0 ise yeni kayıt değilse var olanı güncelliyoruz
            {
                db.Products.Add(pro);
            }
            else//id si olan kaydı güncelle
            {
                var guncellenecekpro = db.Products.Find(pro.ProductID);
                if(guncellenecekpro == null)
                {
                    return HttpNotFound();
                }
                guncellenecekpro.ProductName = pro.ProductName;
            }
            db.SaveChanges();
            return RedirectToAction("Index","Products");
        }
        public ActionResult Guncelle(int id)
        {
            var model = db.Products.Find(id);
            if (model == null)
                return HttpNotFound();

                return View("ProductsForm", model);
        }
        public ActionResult Sil(int id)
        {
            var silinicekpro = db.Products.Find(id);
            if (silinicekpro == null)
                return HttpNotFound();
            db.Products.Remove(silinicekpro);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}