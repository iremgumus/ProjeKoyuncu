using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVCYeni.Models.EntityFramework;
using System.Data.Entity;

namespace MVCYeni.Controllers
{
    public class CategoriesController : Controller
    {
        KoyuncuEntities db = new KoyuncuEntities();
        // GET: Category
        public ActionResult Index()
        {
            var model = db.Categories.Include(x => x.Products).ToList();

            return View(model);
        }

    }
}